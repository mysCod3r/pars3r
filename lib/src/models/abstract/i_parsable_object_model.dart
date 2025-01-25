import 'dart:convert';

import 'package:pars3r/src/models/index.dart';

/// A model that can be parsed from a `String` value.
abstract mixin class IParsableObjectModel<T extends Object>
    implements IParsableModel<T> {
  /// Default constructor for `IParsableObjectModel`.
  const IParsableObjectModel();

  /// Converts a `Map<String, dynamic>` to an object of type `T`.
  ///
  /// This method must be implemented by concrete classes to provide
  /// JSON deserialization logic.
  T fromJson(Map<String, dynamic> json);

  @override
  T parse(String value) {
    final json = jsonDecode(value);
    if (json is! Map<String, dynamic>) {
      throw const FormatException('Invalid json');
    }
    final result = fromJson(json);
    return result;
  }
}
