import 'package:flutter_test/flutter_test.dart';
import 'package:numbers_app/features/data/models/number_model.dart';
import 'package:numbers_app/features/domain/entities/number_entity.dart';

void main() {
  final testNumberModel = NumberModel(
    text: '1 is the first natural number.',
    number: 1,
  );

  final testJson = {'text': '1 is the first natural number.', 'number': 1};

  group('NumberModel Testing', () {
    //1. Parsing from JSON
    test('fromJson must return the correct NumberModel model', () {
      final result = NumberModel.fromJson(testJson);
      expect(result, testNumberModel);
    });

    //2. Serialization to JSON
    test('toJson should return a valid Map', () {
      final result = testNumberModel.toJson();
      expect(result, testJson);
    });

    //3. Convert to Entity
    test('toEntity should return a NumberEntity with the same data', () {
      final result = testNumberModel.toEntity();
      expect(result, isA<NumberEntity>());
      expect(result.text, testNumberModel.text);
      expect(result.number, testNumberModel.number);
    });
  });

  group('NumberEntity extension', () {
    // 4. Conversion from Entity to Model
    test('toModel should return a NumberModel with the same data', () {
      const tEntity = NumberEntity(
        text: '1 is the first natural number.',
        number: 1,
      );
      final result = tEntity.toModel();
      expect(result, isA<NumberModel>());
      expect(result, testNumberModel);
    });
  });
}
