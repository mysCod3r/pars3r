import 'dart:convert';

import 'package:pars3r/pars3r.dart';

/// An interface for services that can parse a `String` value into an object.
abstract mixin class IParsableService {
  /// Default constructor for `IParsableService`.
  const IParsableService();

  /// Parses a `String` value into an object of type `T`.
  R parser<T extends IParsableModel<T>, R>(T model, String sourceString) {
    if (R == List<T>) {
      final listJson = jsonDecode(sourceString) as List<dynamic>;
      final result = listJson
          .map((data) => model.parse(jsonEncode(data)))
          .cast<T>()
          .toList();
      return result as R;
    }
    final value = model.parse(sourceString);
    return value as R;
  }
}
