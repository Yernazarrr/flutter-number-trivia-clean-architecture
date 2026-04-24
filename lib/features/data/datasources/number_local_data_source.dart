import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exceptions.dart';
import '../models/number_model.dart';

abstract interface class NumberLocalDataSource {
  /// Caches a [NumberModel] which was gotten the last time the user had an internet connection.
  /// Throws [CacheException] if an error occurs during caching.
  Future<NumberModel> cacheNumber(NumberModel numberModel);

  /// Gets the cached [NumberModel] which was gotten the last time the user had an internet connection.
  /// Throws [CacheException] if no cached data is present.
  Future<NumberModel> getLastNumber();
}

const cachedNumberKey = 'CACHED_NUMBER';

@Injectable(as: NumberLocalDataSource)
class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberModel> cacheNumber(NumberModel numberModel) async {
    try {
      final jsonString = json.encode(numberModel.toJson());
      final isSaved = await sharedPreferences.setString(
        cachedNumberKey,
        jsonString,
      );

      if (!isSaved) {
        throw CacheException(message: 'Failed to save data to local storage.');
      }
      return numberModel;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to cache data: ${e.toString()}');
    }
  }

  @override
  Future<NumberModel> getLastNumber() async {
    final jsonString = sharedPreferences.getString(cachedNumberKey);

    if (jsonString != null) {
      try {
        return NumberModel.fromJson(json.decode(jsonString));
      } catch (e) {
        throw CacheException(message: 'Failed to read cached data.');
      }
    } else {
      throw CacheException(message: 'No cached data found.');
    }
  }
}
