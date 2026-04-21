import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/number_entity.dart';
import '../repositories/number_repository.dart';

@lazySingleton
class GetRandomNumberUseCase implements UseCase<NumberEntity, NoParams> {
  final NumberRepository numberRepository;

  const GetRandomNumberUseCase({required this.numberRepository});

  @override
  Future<Either<Failure, NumberEntity>> call(NoParams params) async {
    return await numberRepository.getRandomNumber();
  }
}
