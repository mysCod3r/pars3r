import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
class ParsablePrimitiveModel<T extends Object>
    extends IParsablePrimitiveModel<T> {
  /// Creates an instance of `ParsablePrimitiveModel` with the given value.
  const ParsablePrimitiveModel(this.value);

  /// Factory constructor to create an empty instance of the model.
  ///
  /// The default value is determined by the type:
  /// - `String`: `""`
  /// - `int`: `0`
  /// - `bool`: `false`
  /// - `double`: `0.0`
  ///
  /// Throws:
  /// - `TypeError` if the type `T` is unsupported.
  factory ParsablePrimitiveModel.empty() {
    return switch (T) {
      const (String) => ParsablePrimitiveModel('' as T),
      const (int) => ParsablePrimitiveModel(0 as T),
      const (bool) => ParsablePrimitiveModel(false as T),
      const (double) => ParsablePrimitiveModel(0.0 as T),
      Type() => throw TypeError(),
    };
  }

  /// The current value of the primitive type.
  final T value;

  @override
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

  @override
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

  @override
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

  @override
  String toString() => value.toString();
}
