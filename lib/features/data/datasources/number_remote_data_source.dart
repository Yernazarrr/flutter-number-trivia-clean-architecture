import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/error.dart';
import '../models/number_model.dart';

abstract interface class NumberRemoteDataSource {
  Future<Either<Failure, NumberModel>> getConreteNumber(int numnber);
  Future<Either<Failure, NumberModel>> getRandomNumber();
}

@Injectable(as: NumberRemoteDataSource)
class NumberRemoteDataSourceImpl implements NumberRemoteDataSource {
  @override
  Future<Either<Failure, NumberModel>> getConreteNumber(int numnber) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberModel>> getRandomNumber() {
    throw UnimplementedError();
  }
}
