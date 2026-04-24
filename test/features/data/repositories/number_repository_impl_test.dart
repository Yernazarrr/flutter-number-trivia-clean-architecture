import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:numbers_app/core/error/exceptions.dart';
import 'package:numbers_app/core/error/failure.dart';
import 'package:numbers_app/core/network/network_info.dart';
import 'package:numbers_app/features/data/datasources/number_local_data_source.dart';
import 'package:numbers_app/features/data/datasources/number_remote_data_source.dart';
import 'package:numbers_app/features/data/models/number_model.dart';
import 'package:numbers_app/features/data/repositories/number_repository_impl.dart';

import 'number_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NumberRemoteDataSource>(),
  MockSpec<NumberLocalDataSource>(),
  MockSpec<NetworkInfo>(),
])
void main() {
  late NumberRepositoryImpl repository;
  late MockNumberRemoteDataSource mockRemoteDataSource;
  late MockNumberLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNumberRemoteDataSource();
    mockLocalDataSource = MockNumberLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = NumberRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const testNumber = 1;
  const testNumberModel = NumberModel(
    text: '1 is the first natural number.',
    number: 1,
  );
  final testNumberEntity = testNumberModel.toEntity();

  group('getConcreteNumber', () {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data and cache it after a successful request',
        () async {
          when(
            mockRemoteDataSource.getConcreteNumber(any),
          ).thenAnswer((_) async => testNumberModel);

          final result = await repository.getConcreteNumber(number: testNumber);

          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.getConcreteNumber(testNumber));
          verify(mockLocalDataSource.cacheNumber(testNumberModel));
          expect(result, equals(Right(testNumberEntity)));
        },
      );

      test('should return ServerFailure when the remote call fails', () async {
        when(
          mockRemoteDataSource.getConcreteNumber(any),
        ).thenThrow(ServerException(message: 'Server error.'));

        final result = await repository.getConcreteNumber(number: testNumber);

        verify(mockRemoteDataSource.getConcreteNumber(testNumber));
        verifyZeroInteractions(mockLocalDataSource);
        expect(
          result,
          equals(Left(const ServerFailure(message: 'Server error.'))),
        );
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when the device is offline', () async {
        when(
          mockLocalDataSource.getLastNumber(),
        ).thenAnswer((_) async => testNumberModel);

        final result = await repository.getConcreteNumber(number: testNumber);

        verify(mockNetworkInfo.isConnected);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastNumber());
        expect(result, equals(Right(testNumberEntity)));
      });

      test('should return CacheFailure when cached data is missing', () async {
        when(
          mockLocalDataSource.getLastNumber(),
        ).thenThrow(CacheException(message: 'No cache available.'));

        final result = await repository.getConcreteNumber(number: testNumber);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastNumber());
        expect(
          result,
          equals(Left(const CacheFailure(message: 'No cache available.'))),
        );
      });
    });
  });

  group('getRandomNumber', () {
    test('should return remote data when online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockRemoteDataSource.getRandomNumber(),
      ).thenAnswer((_) async => testNumberModel);

      final result = await repository.getRandomNumber();

      verify(mockRemoteDataSource.getRandomNumber());
      verify(mockLocalDataSource.cacheNumber(testNumberModel));
      expect(result, equals(Right(testNumberEntity)));
    });

    test('should return cached data when offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(
        mockLocalDataSource.getLastNumber(),
      ).thenAnswer((_) async => testNumberModel);

      final result = await repository.getRandomNumber();

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastNumber());
      expect(result, equals(Right(testNumberEntity)));
    });
  });
}
