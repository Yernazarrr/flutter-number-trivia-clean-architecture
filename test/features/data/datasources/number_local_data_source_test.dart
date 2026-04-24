import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:numbers_app/core/error/exceptions.dart';
import 'package:numbers_app/features/data/datasources/number_local_data_source.dart';
import 'package:numbers_app/features/data/models/number_model.dart';

import 'number_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late NumberLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  const tNumberModel = NumberModel(
    number: 1,
    text: '1 is the first natural number.',
  );
  const cachedNumberKey = 'CACHED_NUMBER';

  group('getLastNumber', () {
    test(
      'should return NumberModel from SharedPreferences when cached data exists',
      () async {
        final expectedJsonString = json.encode(tNumberModel.toJson());
        when(
          mockSharedPreferences.getString(any),
        ).thenReturn(expectedJsonString);

        final result = await dataSource.getLastNumber();

        verify(mockSharedPreferences.getString(cachedNumberKey));
        expect(result, equals(tNumberModel));
      },
    );

    test('should throw CacheException when cache is empty', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      expect(() => dataSource.getLastNumber(), throwsA(isA<CacheException>()));
    });

    test('should throw CacheException when cached JSON is invalid', () async {
      when(mockSharedPreferences.getString(any)).thenReturn('{invalid json}');

      expect(() => dataSource.getLastNumber(), throwsA(isA<CacheException>()));
    });
  });

  group('cacheNumber', () {
    test('should use SharedPreferences to cache data', () async {
      final expectedJsonString = json.encode(tNumberModel.toJson());
      when(
        mockSharedPreferences.setString(any, any),
      ).thenAnswer((_) async => true);

      await dataSource.cacheNumber(tNumberModel);

      verify(
        mockSharedPreferences.setString(cachedNumberKey, expectedJsonString),
      );
    });

    test(
      'should throw CacheException when SharedPreferences returns false',
      () async {
        when(
          mockSharedPreferences.setString(any, any),
        ).thenAnswer((_) async => false);

        expect(
          () => dataSource.cacheNumber(tNumberModel),
          throwsA(isA<CacheException>()),
        );
      },
    );
  });
}
