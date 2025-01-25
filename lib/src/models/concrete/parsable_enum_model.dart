import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
class ParsableEnumModel<T extends IParsableEnum>
    extends IParsableEnumModel<ParsableEnumModel<T>> {
  /// Creates an instance of `ParsableEnumModel` with the given enum value.
  const ParsableEnumModel(this.value);

  /// The current value of the enum.
  final T value;

  @override
  String toString() => value.toString();

  @override
  ParsableEnumModel<T> fromString(String value) {
    final parsed = this.value.enumValues.firstWhere(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
          orElse: () => throw ArgumentError.value(
            value,
            'value',
            'No matching enum value found for "$value".',
          ),
        );
    return ParsableEnumModel(parsed as T);
  }
}
