import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers_app/core/error/failure.dart';
import 'package:numbers_app/features/domain/entities/number_entity.dart';

import 'package:numbers_app/features/domain/repositories/number_repository.dart';
import 'package:numbers_app/features/domain/usecases/get_concrete_number_use_case.dart';

import 'get_concrete_number_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberRepository>()])
void main() {
  late GetConcreteNumberUseCase getConcreteNumberUseCase;
  late MockNumberRepository mockNumberRepository;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    getConcreteNumberUseCase = GetConcreteNumberUseCase(
      numberRepository: mockNumberRepository,
    );

    provideDummy<Either<Failure, NumberEntity>>(
      Left(ServerFailure(message: 'Server error')),
    );
  });

  test('Должен вывести информацию о числе', () async {
    final number = 1;
    final numberEntity = NumberEntity(
      text: '1 is the first natural number.',
      number: 1,
    );

    // Arrange
    when(
      mockNumberRepository.getConcreteNumber(number: anyNamed('number')),
    ).thenAnswer((_) async => Right(numberEntity));

    // Act
    final result = await getConcreteNumberUseCase.call(
      GetConcreteNumberUseCaseParams(number: number),
    );

    // Assert
    expect(result, Right(numberEntity));
    verify(mockNumberRepository.getConcreteNumber(number: number));
    verifyNoMoreInteractions(mockNumberRepository);
  });
}
