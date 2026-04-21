import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_entity.freezed.dart';

@freezed
abstract class NumberEntity with _$NumberEntity {
  const factory NumberEntity({required String text, required int number}) =
      _NumberEntity;
}
