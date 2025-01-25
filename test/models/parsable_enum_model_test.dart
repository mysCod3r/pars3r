import 'package:pars3r/pars3r.dart';
import 'package:test/test.dart';

import '../common/index.dart';

void main() {
  group('ParsableEnumModel Tests ', () {
    group('ParsableEnumModel Success Tests', () {
      test('should return the correct enum value', () {
        const model = ParsableEnumModel(MockEnum.test);
        expect(model.value, equals(MockEnum.test));
      });

      test('should return the correct enum value when converting to string',
          () {
        const model = ParsableEnumModel(MockEnum.test);
        expect(model.toString(), equals(MockEnum.test.toString()));
      });

      test('should return the correct enum value when parsing', () {
        const model = ParsableEnumModel(MockEnum.empty);
        final result = model.parse('test');
        expect(result.value, equals(MockEnum.test));
      });

      test('should parse enum value case insensitively', () {
        const model = ParsableEnumModel(MockEnum.empty);
        final result = model.parse('TEST');
        expect(result.value, equals(MockEnum.test));
      });

      test('should parse all enum values correctly', () {
        const model = ParsableEnumModel(MockEnum.empty);

        for (final enumValue in MockEnum.values) {
          final result = model.parse(enumValue.name);
          expect(result.value, equals(enumValue));
        }
      });
    });

    group('ParsableEnumModel Failure Tests', () {
      test('should throw an error when parsing an invalid enum value', () {
        const model = ParsableEnumModel(MockEnum.empty);
        expect(() => model.parse('invalid'), throwsArgumentError);
      });

      test('should throw an error when parsing an empty string', () {
        const model = ParsableEnumModel(MockEnum.empty);
        expect(() => model.parse(''), throwsArgumentError);
      });

      test('should throw an error when parsing an invalid enum value', () {
        const model = ParsableEnumModel(MockEnum.empty);
        expect(() => model.parse('invalid'), throwsArgumentError);
      });

      test('should handle empty enum values gracefully', () {
        final model = ParsableEnumModel(MockEnumEmptyValues.values.first);
        expect(
          () => model.parse(MockEnumEmptyValues.values.first.toString()),
          throwsArgumentError,
        );
      });
    });
  });
}
