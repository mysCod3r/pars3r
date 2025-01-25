/// An interface for enums that can be parsed from a `String` value.
abstract mixin class IParsableEnum<T extends Enum> {
  /// This property must return the enum's `values` list.
  List<T> get enumValues;
}
