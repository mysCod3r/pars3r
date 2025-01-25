import 'package:pars3r/pars3r.dart';
import 'package:test/test.dart';

import '../common/index.dart';

class TestParsableService with IParsableService {}

void main() {
  group('IParsableService Tests with MockProduct', () {
    late TestParsableService service;

    setUp(() {
      service = TestParsableService();
    });

    group('Success cases', () {
      test('Should parse a single MockProduct from a valid JSON string', () {
        const jsonString = '{"id": "p1", "name": "Laptop", "price": 1500.0}';
        const mockProduct = MockProduct.empty();

        final result = service.parser<MockProduct, MockProduct>(
          mockProduct,
          jsonString,
        );

        expect(result, isA<MockProduct>());
        expect(result.id, equals('p1'));
        expect(result.name, equals('Laptop'));
        expect(result.price, equals(1500.0));
      });

      test('Should parse a list of MockProducts from a valid JSON string', () {
        const jsonString = '''
        [
          {"id": "p1", "name": "Laptop", "price": 1500.0},
          {"id": "p2", "name": "Phone", "price": 800.0}
        ]
        ''';
        const mockProduct = MockProduct.empty();

        final result = service.parser<MockProduct, List<MockProduct>>(
          mockProduct,
          jsonString,
        );

        expect(result, isA<List<MockProduct>>());
        expect(result.length, equals(2));
        expect(
          result[0],
          equals(const MockProduct(id: 'p1', name: 'Laptop', price: 1500)),
        );
        expect(
          result[1],
          equals(const MockProduct(id: 'p2', name: 'Phone', price: 800)),
        );
      });

      test('Should parse a single MockProduct with edge case values', () {
        const jsonString = '{"id": "p1", "name": "", "price": 0.0}';
        const mockProduct = MockProduct.empty();

        final result =
            service.parser<MockProduct, MockProduct>(mockProduct, jsonString);

        expect(result, isA<MockProduct>());
        expect(result.id, equals('p1'));
        expect(result.name, isEmpty);
        expect(result.price, equals(0.0));
      });

      test('Should parse an empty list of MockProducts', () {
        const jsonString = '[]';
        const mockProduct = MockProduct.empty();

        final result = service.parser<MockProduct, List<MockProduct>>(
          mockProduct,
          jsonString,
        );

        expect(result, isA<List<MockProduct>>());
        expect(result, isEmpty);
      });
    });

    group('Failure cases', () {
      test('Should throw FormatException for invalid JSON string', () {
        const invalidJsonString = 'invalid json';
        const mockProduct = MockProduct.empty();

        expect(
          () => service.parser<MockProduct, MockProduct>(
            mockProduct,
            invalidJsonString,
          ),
          throwsA(isA<FormatException>()),
        );
      });

      test('Should throw TypeError for missing required fields', () {
        // Missing 'price' field
        const jsonString = '{"id": "p1", "name": "Laptop"}';
        const mockProduct = MockProduct.empty();

        expect(
          () => service.parser<MockProduct, MockProduct>(
            mockProduct,
            jsonString,
          ),
          throwsA(isA<TypeError>()),
        );
      });

      test('Should throw FormatException for malformed JSON array', () {
        // Missing closing bracket
        const invalidJsonString =
            '[{"id": "p1", "name": "Laptop", "price": 1500.0}';
        const mockProduct = MockProduct.empty();

        expect(
          () => service.parser<MockProduct, List<MockProduct>>(
            mockProduct,
            invalidJsonString,
          ),
          throwsA(isA<FormatException>()),
        );
      });

      test('Should throw TypeError for invalid data type in JSON', () {
        // 'price' should be a double, not a string
        const jsonString = '{"id": "p1", "name": "Laptop", "price": "1500"}';
        const mockProduct = MockProduct.empty();

        expect(
          () => service.parser<MockProduct, MockProduct>(
            mockProduct,
            jsonString,
          ),
          throwsA(isA<TypeError>()),
        );
      });

      test('Should throw FormatException for empty JSON string', () {
        const jsonString = '';
        const mockProduct = MockProduct.empty();

        expect(
          () => service.parser<MockProduct, MockProduct>(
            mockProduct,
            jsonString,
          ),
          throwsA(isA<FormatException>()),
        );
      });
    });
  });
}
