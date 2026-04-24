import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:numbers_app/core/error/exceptions.dart';
import 'package:numbers_app/features/data/datasources/number_api_client.dart';
import 'package:numbers_app/features/data/datasources/number_remote_data_source.dart';
import 'package:numbers_app/features/data/models/number_model.dart';

import 'number_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberApiClient>()])
void main() {
  late NumberRemoteDataSourceImpl dataSource;
  late MockNumberApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockNumberApiClient();
    dataSource = NumberRemoteDataSourceImpl(mockApiClient);
  });

  const testNumber = 1;
  const testNumberModel = NumberModel(
    text: '1 is the first natural number.',
    number: 1,
  );

  group('getConcreteNumber', () {
    test('should return NumberModel when the Retrofit call succeeds', () async {
      when(
        mockApiClient.getConcreteNumber(any),
      ).thenAnswer((_) async => testNumberModel);

      final result = await dataSource.getConcreteNumber(testNumber);

      expect(result, equals(testNumberModel));
      verify(mockApiClient.getConcreteNumber(testNumber));
      verifyNoMoreInteractions(mockApiClient);
    });

    test(
      'should rethrow a custom exception when it comes from the interceptor',
      () async {
        final customException = NotFoundException(
          message: 'Resource not found.',
        );
        when(mockApiClient.getConcreteNumber(any)).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: customException,
          ),
        );

        expect(
          () => dataSource.getConcreteNumber(testNumber),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      'should throw ServerException when DioException has no custom error',
      () async {
        when(mockApiClient.getConcreteNumber(any)).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            message: 'Some internal dio error',
          ),
        );

        expect(
          () => dataSource.getConcreteNumber(testNumber),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });

  group('getRandomNumber', () {
    test('should return NumberModel when the request succeeds', () async {
      when(
        mockApiClient.getRandomNumber(),
      ).thenAnswer((_) async => testNumberModel);

      final result = await dataSource.getRandomNumber();

      expect(result, equals(testNumberModel));
      verify(mockApiClient.getRandomNumber());
      verifyNoMoreInteractions(mockApiClient);
    });

    test(
      'should throw UnexpectedException for an unknown non-Dio error',
      () async {
        when(
          mockApiClient.getRandomNumber(),
        ).thenThrow(Exception('Something went wrong'));

        expect(
          () => dataSource.getRandomNumber(),
          throwsA(isA<UnexpectedException>()),
        );
      },
    );
  });
}
