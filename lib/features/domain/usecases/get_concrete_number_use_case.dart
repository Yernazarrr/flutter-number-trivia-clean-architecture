import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:numbers_app/core/error/failure.dart';
import 'package:numbers_app/core/usecase/usecase.dart';
import 'package:numbers_app/features/domain/entities/number_entity.dart';

import '../repositories/number_repository.dart';

@lazySingleton
class GetConcreteNumberUseCase
    implements UseCase<NumberEntity, GetConcreteNumberUseCaseParams> {
  final NumberRepository numberRepository;

  GetConcreteNumberUseCase({required this.numberRepository});

  @override
  Future<Either<Failure, NumberEntity>> call(
    GetConcreteNumberUseCaseParams params,
  ) async {
    return await numberRepository.getConcreteNumber(number: params.number);
  }
}

class GetConcreteNumberUseCaseParams extends Equatable {
  final int number;

  const GetConcreteNumberUseCaseParams({required this.number});

  @override
  List<Object?> get props => [number];
}
