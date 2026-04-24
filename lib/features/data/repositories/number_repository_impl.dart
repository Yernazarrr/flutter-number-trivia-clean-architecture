import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/repositories/number_repository.dart';
import '../datasources/number_local_data_source.dart';
import '../datasources/number_remote_data_source.dart';
import '../models/number_model.dart';

@Injectable(as: NumberRepository)
class NumberRepositoryImpl implements NumberRepository {
  static const _networkCheckTimeout = Duration(seconds: 5);

  final NumberRemoteDataSource remoteDataSource;
  final NumberLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const NumberRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberEntity>> getConcreteNumber({
    required int number,
  }) async {
    return await _getNumber(() => remoteDataSource.getConcreteNumber(number));
  }

  @override
  Future<Either<Failure, NumberEntity>> getRandomNumber() async {
    return await _getNumber(() => remoteDataSource.getRandomNumber());
  }

  /// Reuses the same flow for remote fetch, cache, and failure mapping.
  Future<Either<Failure, NumberEntity>> _getNumber(
    Future<NumberModel> Function() getNumberRemote,
  ) async {
    final isConnected = await _resolveConnectionStatus();

    if (isConnected) {
      try {
        final remoteNumber = await getNumberRemote();
        await localDataSource.cacheNumber(remoteNumber);

        return Right(remoteNumber.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on NotFoundException catch (e) {
        return Left(NotFoundFailure(message: e.message));
      } on InvalidInputException catch (e) {
        return Left(InvalidInputFailure(message: e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(message: e.message));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      try {
        final localNumber = await localDataSource.getLastNumber();

        return Right(localNumber.toEntity());
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    }
  }

  Future<bool> _resolveConnectionStatus() async {
    try {
      return await networkInfo.isConnected.timeout(
        _networkCheckTimeout,
        onTimeout: () => true,
      );
    } catch (_) {
      return true;
    }
  }
}
