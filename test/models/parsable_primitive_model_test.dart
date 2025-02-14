import 'package:pars3r/pars3r.dart';
import 'package:test/test.dart';

void main() {
  group('ParsablePrimitiveModel Tests', () {
    group('ParsablePrimitiveModel Success Tests', () {
      test('should parse a valid string correctly', () {
        final model = ParsablePrimitiveModel<String>.empty();
        final result = model.parse('test');
        expect(result.value, equals('test'));
      });

      test('should parse a valid string correctly with toString()', () {
        final model = ParsablePrimitiveModel<String>.empty();
        final result = model.parse('test');
        expect(result.toString(), equals('test'));
      });

      test('should parse a valid integer correctly', () {
        final model = ParsablePrimitiveModel<int>.empty();
        final result = model.parse('1');
        expect(result.value, equals(1));
      });

      test('should parse a valid double correctly', () {
        final model = ParsablePrimitiveModel<double>.empty();
        final result = model.parse('1.23');
        expect(result.value, equals(1.23));
      });

      test('should parse a valid (false) boolean correctly', () {
        final model = ParsablePrimitiveModel<bool>.empty();
        final result = model.parse('false');
        expect(result.value, equals(false));
      });

      test('should parse a valid (0) boolean correctly', () {
        final model = ParsablePrimitiveModel<bool>.empty();
        final result = model.parse('0');
        expect(result.value, equals(false));
      });

      test('should parse a valid (true) boolean correctly', () {
        final model = ParsablePrimitiveModel<bool>.empty();
        final result = model.parse('true');
        expect(result.value, equals(true));
      });

      test('should parse a valid (1) boolean correctly', () {
        final model = ParsablePrimitiveModel<bool>.empty();
        final result = model.parse('1');
        expect(result.value, equals(true));
      });
    });

    group('ParsablePrimitiveModel Failure Tests', () {
      test('should throw an error when parsing an invalid integer', () {
        const model = ParsablePrimitiveModel<int>(1);
        expect(() => model.parse('invalid'), throwsArgumentError);
      });

      test('should throw an error when parsing an invalid double', () {
        const model = ParsablePrimitiveModel<double>(1.23);
        expect(() => model.parse('invalid'), throwsArgumentError);
      });

      test('should throw an error when parsing an invalid boolean', () {
        const model = ParsablePrimitiveModel<bool>(false);
        expect(() => model.parse('invalid'), throwsArgumentError);
      });

      test('should throw an error when defining an invalid type', () {
        expect(
          ParsablePrimitiveModel<DateTime>.empty,
          throwsA(isA<TypeError>()),
        );
      });

      test('should throw an error when parsing an invalid type', () {
        expect(
          () => ParsablePrimitiveModel(DateTime.now()).parse('invalid'),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
