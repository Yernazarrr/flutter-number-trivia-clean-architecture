import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/usecases/get_concrete_number_use_case.dart';
import '../../domain/usecases/get_random_number_use_case.dart';
import 'number_event.dart';
import 'number_state.dart';

@injectable
class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GetConcreteNumberUseCase _getConcreteNumber;
  final GetRandomNumberUseCase _getRandomNumber;

  NumberBloc({
    required GetConcreteNumberUseCase getConcreteNumber,
    required GetRandomNumberUseCase getRandomNumber,
  }) : _getConcreteNumber = getConcreteNumber,
       _getRandomNumber = getRandomNumber,
       super(const NumberState.initial()) {
    on<GetConcreteNumberEvent>(_onGetConcreteNumber);
    on<GetRandomNumberEvent>(_onGetRandomNumber);
  }

  List<NumberEntity> get _currentHistory => switch (state) {
    Initial() => const [],
    Loading(:final history) => history,
    Loaded(:final history) => history,
    ErrorDetails(:final history) => history,
  };

  Future<void> _onGetConcreteNumber(
    GetConcreteNumberEvent event,
    Emitter<NumberState> emit,
  ) async {
    final history = _currentHistory;
    emit(NumberState.loading(history: history));

    try {
      final failureOrNumber = await _getConcreteNumber(
        GetConcreteNumberUseCaseParams(number: event.number),
      );

      emit(
        failureOrNumber.fold(
          (failure) => NumberState.error(
            message: _mapFailureToMessage(failure),
            history: history,
          ),
          (number) =>
              NumberState.loaded(number: number, history: [number, ...history]),
        ),
      );
    } catch (_) {
      emit(
        NumberState.error(
          message: 'Unexpected error occurred.',
          history: history,
        ),
      );
    }
  }

  Future<void> _onGetRandomNumber(
    GetRandomNumberEvent event,
    Emitter<NumberState> emit,
  ) async {
    final history = _currentHistory;
    emit(NumberState.loading(history: history));

    try {
      final failureOrNumber = await _getRandomNumber(NoParams());

      emit(
        failureOrNumber.fold(
          (failure) => NumberState.error(
            message: _mapFailureToMessage(failure),
            history: history,
          ),
          (number) =>
              NumberState.loaded(number: number, history: [number, ...history]),
        ),
      );
    } catch (_) {
      emit(
        NumberState.error(
          message: 'Unexpected error occurred.',
          history: history,
        ),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message.isNotEmpty ? failure.message : 'Server error.';
    } else if (failure is CacheFailure) {
      return failure.message.isNotEmpty
          ? failure.message
          : 'Local storage error.';
    } else if (failure is NetworkFailure) {
      return failure.message.isNotEmpty
          ? failure.message
          : 'No internet connection.';
    } else if (failure is NotFoundFailure) {
      return failure.message.isNotEmpty
          ? failure.message
          : 'Requested data was not found.';
    } else if (failure is InvalidInputFailure) {
      return failure.message.isNotEmpty
          ? failure.message
          : 'Invalid input format.';
    } else {
      return 'Unexpected error occurred.';
    }
  }
}
