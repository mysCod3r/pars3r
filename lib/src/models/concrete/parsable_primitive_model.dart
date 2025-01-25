import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
class ParsablePrimitiveModel<T extends Object>
    extends IParsablePrimitiveModel<ParsablePrimitiveModel<T>> {
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
  String toString() => value.toString();

  @override
  ParsablePrimitiveModel<T> parse(String value) {
    final parsed = switch (T) {
      const (String) => value,
      const (int) => super.parseInt(value),
      const (bool) => super.parseBool(value),
      const (double) => super.parseDouble(value),
      Type() => throw TypeError(),
    };
    return ParsablePrimitiveModel(parsed as T);
  }
}
