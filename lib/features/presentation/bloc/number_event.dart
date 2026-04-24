import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_event.freezed.dart';

@freezed
sealed class NumberEvent with _$NumberEvent {
  const factory NumberEvent.getConcreteNumber(int number) =
      GetConcreteNumberEvent;
  const factory NumberEvent.getRandomNumber() = GetRandomNumberEvent;
}
