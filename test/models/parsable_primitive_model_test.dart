import 'package:pars3r/pars3r.dart';
import 'package:test/test.dart';

void main() {
  group('ParsablePrimitiveModel Tests', () {
    group('ParsablePrimitiveModel Success Tests', () {
      test('should parse a valid string correctly', () {
        const model = ParsablePrimitiveModel<String>('test');
        final result = model.parse('test');
        expect(result.value, equals('test'));
      });

      test('should parse a valid integer correctly', () {
        const model = ParsablePrimitiveModel<int>(1);
        final result = model.parse('1');
        expect(result.value, equals(1));
      });

      test('should parse a valid double correctly', () {
        const model = ParsablePrimitiveModel<double>(1.23);
        final result = model.parse('1.23');
        expect(result.value, equals(1.23));
      });

      test('should parse a valid (false) boolean correctly', () {
        const model = ParsablePrimitiveModel<bool>(false);
        final result = model.parse('false');
        expect(result.value, equals(false));
      });

      test('should parse a valid (0) boolean correctly', () {
        const model = ParsablePrimitiveModel<bool>(false);
        final result = model.parse('0');
        expect(result.value, equals(false));
      });

      test('should parse a valid (true) boolean correctly', () {
        const model = ParsablePrimitiveModel<bool>(false);
        final result = model.parse('true');
        expect(result.value, equals(true));
      });

      test('should parse a valid (1) boolean correctly', () {
        const model = ParsablePrimitiveModel<bool>(false);
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

      test('should throw an error when parsing an invalid type', () {
        final model = ParsablePrimitiveModel<DateTime>(DateTime.now());
        expect(() => model.parse('invalid'), throwsA(isA<TypeError>()));
      });
    });
  });
}
