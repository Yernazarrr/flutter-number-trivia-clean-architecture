import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/repositories/number_repository.dart';

@Injectable(as: NumberRepository)
class NumberRepositoryImpl implements NumberRepository {
  @override
  Future<Either<Failure, NumberEntity>> getConcreteNumber({
    required int number,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberEntity>> getRandomNumber() {
    throw UnimplementedError();
  }
}
