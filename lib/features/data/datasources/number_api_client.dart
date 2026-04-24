import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/number_model.dart';

part 'number_api_client.g.dart';

@RestApi(baseUrl: 'http://numbersapi.com/')
abstract class NumberApiClient {
  factory NumberApiClient(Dio dio, {String baseUrl}) = _NumberApiClient;

  @GET('{number}?json')
  Future<NumberModel> getConcreteNumber(@Path('number') int number);

  @GET('random?json')
  Future<NumberModel> getRandomNumber();
}
