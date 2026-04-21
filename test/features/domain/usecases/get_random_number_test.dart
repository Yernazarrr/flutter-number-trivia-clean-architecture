import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers_app/core/error/error.dart';
import 'package:numbers_app/core/usecase/usecase.dart';
import 'package:numbers_app/features/domain/entities/number_entity.dart';
import 'package:numbers_app/features/domain/repositories/number_repository.dart';
import 'package:numbers_app/features/domain/usecases/get_random_number_use_case.dart';

import 'get_random_number_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberRepository>()])
void main() {
  late GetRandomNumberUseCase getRandomNumberUseCase;
  late MockNumberRepository mockNumberRepository;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    getRandomNumberUseCase = GetRandomNumberUseCase(
      numberRepository: mockNumberRepository,
    );

    provideDummy<Either<Failure, NumberEntity>>(
      Left(ServerFailure(message: 'Server error')),
    );
  });

  test('Должен вывести информацию о случайном числе', () async {
    final numberEntity = NumberEntity(
      text: '1 is the first natural number.',
      number: 1,
    );

    // Arrange
    when(
      mockNumberRepository.getRandomNumber(),
    ).thenAnswer((_) async => Right(numberEntity));

    // Act
    final result = await getRandomNumberUseCase.call(NoParams());

    // Assert
    expect(result, Right(numberEntity));
    verify(mockNumberRepository.getRandomNumber());
    verifyNoMoreInteractions(mockNumberRepository);
  });
}
