import 'package:test/test.dart';

import '../common/index.dart';

void main() {
  group('IParsableObjectModel Tests', () {
    group('MockForceUpdateModel Tests', () {
      group('MockForceUpdateModel Success Tests', () {
        test('should parse valid JSON correctly', () {
          const jsonString = '{"version": "1.2.3", "force_update": true}';
          const model = MockForceUpdateModel.empty();

          final parsedModel = model.parse(jsonString);

          expect(parsedModel.version, equals('1.2.3'));
          expect(parsedModel.forceUpdate, isTrue);
        });
      });

      group('MockForceUpdateModel Failure Tests', () {
        test('should throw an error when parsing invalid JSON', () {
          const jsonString = 'invalid json';
          const model = MockForceUpdateModel.empty();

          expect(() => model.parse(jsonString), throwsFormatException);
        });

        test('should throw an error when parsing empty JSON', () {
          const jsonString = '{}';
          const model = MockForceUpdateModel.empty();

          expect(() => model.parse(jsonString), throwsA(isA<TypeError>()));
        });

        test('should correctly handle missing force_update field in JSON', () {
          const jsonString = '{"version": "1.2.3"}';
          const model = MockForceUpdateModel.empty();

          expect(() => model.parse(jsonString), throwsA(isA<TypeError>()));
        });

        test('should correctly handle missing version field in JSON', () {
          const jsonString = '{"force_update": true}';
          const model = MockForceUpdateModel.empty();

          expect(() => model.parse(jsonString), throwsA(isA<TypeError>()));
        });
      });
    });
  });
}
