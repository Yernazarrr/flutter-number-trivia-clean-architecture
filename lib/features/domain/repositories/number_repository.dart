import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../entities/number_entity.dart';

abstract interface class NumberRepository {
  Future<Either<Failure, NumberEntity>> getRandomNumber();
  Future<Either<Failure, NumberEntity>> getConcreteNumber({
    required int number,
  });
}
