import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/exceptions.dart';
import '../models/number_model.dart';
import 'number_api_client.dart';

abstract interface class NumberRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  Future<NumberModel> getConcreteNumber(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  Future<NumberModel> getRandomNumber();
}

@Injectable(as: NumberRemoteDataSource)
class NumberRemoteDataSourceImpl implements NumberRemoteDataSource {
  final NumberApiClient _apiClient;

  NumberRemoteDataSourceImpl(this._apiClient);

  @override
  Future<NumberModel> getConcreteNumber(int number) async {
    return _performApiCall(() => _apiClient.getConcreteNumber(number));
  }

  @override
  Future<NumberModel> getRandomNumber() async {
    return _performApiCall(() => _apiClient.getRandomNumber());
  }

  /// Wraps API calls and converts transport errors into app exceptions.
  Future<T> _performApiCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      if (e.error is Exception) {
        throw e.error as Exception;
      }
      throw ServerException(message: 'Unexpected server error: ${e.message}');
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }
}
