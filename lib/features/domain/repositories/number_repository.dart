import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../entities/number_entity.dart';

abstract interface class NumberRepository {
  ///Gets a concrete [NumberEntity] for the given [number].
  ///Returns a [Failure] if there was an error during the process.
  Future<Either<Failure, NumberEntity>> getRandomNumber();

  ///Gets a random [NumberEntity].
  ///Returns a [Failure] if there was an error during the process.
  Future<Either<Failure, NumberEntity>> getConcreteNumber({
    required int number,
  });
}
