import 'package:pars3r/src/models/index.dart';

/// An interface for models that can be parsed from a `String` value.
abstract mixin class IParsableEnumModel<T extends IParsableEnum>
    implements IParsableModel<T> {
  /// Default constructor for `IParsableEnumModel`.
  const IParsableEnumModel();

  /// Parses a `String` value into an object of type `T`.
  T fromString(String value);

  @override
  T parse(String value) => fromString(value);
}
