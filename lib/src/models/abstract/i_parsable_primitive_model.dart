import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
abstract mixin class IParsablePrimitiveModel<T extends Object>
    implements IParsableModel<T> {
  /// Creates an instance of `IParsablePrimitiveModel` with the given value.
  const IParsablePrimitiveModel();

  /// Parses a `String` value into an object of type `int`.
  int parseInt(String value);

  /// Parses a `String` value into an object of type `bool`.
  bool parseBool(String value);

  /// Parses a `String` value into an object of type `double`.
  double parseDouble(String value);

  @override
  T parse(String value) {
    final parsed = switch (T) {
      const (String) => value,
      const (int) => parseInt(value),
      const (bool) => parseBool(value),
      const (double) => parseDouble(value),
      Type() => throw TypeError(),
    } as T;
    return parsed;
  }
}
