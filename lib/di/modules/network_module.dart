import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../core/network/interceptors/custom_dio_interceptor.dart';
import '../../features/data/datasources/number_api_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(CustomDioInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  @lazySingleton
  NumberApiClient apiClient(Dio dio) => NumberApiClient(dio);

  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();
}
