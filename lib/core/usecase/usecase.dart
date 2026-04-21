import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

abstract interface class UseCase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
