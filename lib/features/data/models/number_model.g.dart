// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NumberModel _$NumberModelFromJson(Map<String, dynamic> json) => _NumberModel(
  text: json['text'] as String,
  number: (json['number'] as num).toInt(),
);

Map<String, dynamic> _$NumberModelToJson(_NumberModel instance) =>
    <String, dynamic>{'text': instance.text, 'number': instance.number};
