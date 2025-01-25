import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
abstract mixin class IParsablePrimitiveModel<T extends Object>
    implements IParsableModel<T> {
  /// Creates an instance of `IParsablePrimitiveModel` with the given value.
  const IParsablePrimitiveModel();

  /// Parses a `String` value into an object of type `T`.
  int parseInt(String value) {
    final intValue = int.tryParse(value);
    if (intValue == null) {
      throw ArgumentError.value(
        value,
        'value',
        'Cannot parse "$value" as an integer.',
      );
    }
    return intValue;
  }

  /// Parses a `String` value into a `bool`.
  bool parseBool(String value) {
    final lowerCase = value.trim().toLowerCase();
    final isTrue = lowerCase == 'true' || lowerCase == '1';
    final isFalse = lowerCase == 'false' || lowerCase == '0';
    if (!isTrue && !isFalse) {
      throw ArgumentError.value(
        value,
        'value',
        'Cannot parse "$value" as a boolean.',
      );
    }
    return isTrue;
  }

  /// Parses a `String` value into a `double`.
  double parseDouble(String value) {
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      throw ArgumentError.value(
        value,
        'value',
        'Cannot parse "$value" as a double.',
      );
    }
    return doubleValue;
  }
}
