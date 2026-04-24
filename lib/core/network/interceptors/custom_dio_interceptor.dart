import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';

class CustomDioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Exception customException;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        final details = [err.message, err.error?.toString()]
            .whereType<String>()
            .map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .join(' | ');
        customException = NetworkException(
          message: details.isEmpty
              ? 'Network connection error.'
              : 'Network connection error. $details',
        );
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 404) {
          customException = NotFoundException(message: 'Resource not found.');
        } else if (statusCode != null && statusCode >= 500) {
          customException = ServerException(message: 'Server error.');
        } else if (statusCode == 400) {
          customException = InvalidInputException(message: 'Invalid input.');
        } else {
          customException = ServerException(
            message: 'Unexpected server response: $statusCode.',
          );
        }
        break;
      default:
        customException = UnexpectedException(
          message: 'Unexpected error: ${err.message}',
        );
    }

    return handler.next(err.copyWith(error: customException));
  }
}
