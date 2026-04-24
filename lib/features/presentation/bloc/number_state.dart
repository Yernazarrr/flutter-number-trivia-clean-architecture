import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/number_entity.dart';

part 'number_state.freezed.dart';

@freezed
sealed class NumberState with _$NumberState {
  const factory NumberState.initial() = Initial;

  const factory NumberState.loading({@Default([]) List<NumberEntity> history}) =
      Loading;

  const factory NumberState.loaded({
    required NumberEntity number,
    @Default([]) List<NumberEntity> history,
  }) = Loaded;

  const factory NumberState.error({
    required String message,
    @Default([]) List<NumberEntity> history,
  }) = ErrorDetails;
}
