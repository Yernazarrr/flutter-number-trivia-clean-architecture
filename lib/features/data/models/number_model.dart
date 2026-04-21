import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/number_entity.dart';

part 'number_model.freezed.dart';
part 'number_model.g.dart';

@freezed
abstract class NumberModel with _$NumberModel {
  const factory NumberModel({required String text, required int number}) =
      _NumberModel;

  factory NumberModel.fromJson(Map<String, dynamic> json) =>
      _$NumberModelFromJson(json);
}

extension NumberModelX on NumberModel {
  NumberEntity toEntity() {
    return NumberEntity(text: text, number: number);
  }
}

extension NumberEntityX on NumberEntity {
  NumberModel toModel() {
    return NumberModel(text: text, number: number);
  }
}
