/// An interface for models that can be parsed from a `String` value.
abstract class IParsableModel<T extends Object> {
  /// Default constructor for `IParsableModel`.
  const IParsableModel();

  /// Parses a `String` value into an object of type `T`.
  ///
  /// This method must be implemented by concrete classes to handle the
  /// parsing logic for specific model types.
  ///
  /// Throws:
  /// - `FormatException` if the input format is invalid.
  /// - `ArgumentError` if the value cannot be parsed to the expected type.
  /// - `TypeError` for type mismatches during parsing.
  T parse(String value);
}
