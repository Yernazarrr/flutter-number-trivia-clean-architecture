import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:numbers_app/core/error/failure.dart';
import 'package:numbers_app/features/data/models/number_model.dart';

abstract interface class NumberLocalDataSource {
  Future<Either<Failure, NumberModel>> cacheNumber(int number);
}

@Injectable(as: NumberLocalDataSource)
class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  @override
  Future<Either<Failure, NumberModel>> cacheNumber(int number) {
    throw UnimplementedError ();
  }
}
