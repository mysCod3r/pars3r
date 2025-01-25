import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pars3r/pars3r.dart';

/// Represents a model for a force update configuration in remote settings.
///
/// This model is used to represent the configuration for forced app updates,
/// including the version number and whether the update is mandatory.
@immutable
class ForceUpdateModel extends IParsableObjectModel<ForceUpdateModel> {
  /// Constructs a new instance of [ForceUpdateModel].
  ///
  /// Parameters:
  /// - `version`: The version of the application that requires the force update
  /// - `forceUpdate`: A boolean flag indicating whether the update is mandatory
  const ForceUpdateModel({
    required this.version,
    required this.forceUpdate,
  });

  /// Creates an empty instance of [ForceUpdateModel],
  const ForceUpdateModel.empty() : this(version: '1.0.0', forceUpdate: false);

  /// The version of the app that triggers the forced update.
  final String version;

  /// A flag indicating whether the update is mandatory.
  final bool forceUpdate;

  @override
  ForceUpdateModel fromJson(Map<String, dynamic> json) {
    return ForceUpdateModel(
      version: json['version'] as String,
      forceUpdate: json['force_update'] as bool,
    );
  }

  /// Converts this [ForceUpdateModel] instance into a JSON object.
  ///
  /// Returns:
  /// - A Map<String, dynamic> representing the serialized model.
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'force_update': forceUpdate,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForceUpdateModel &&
        other.version == version &&
        other.forceUpdate == forceUpdate;
  }

  @override
  int get hashCode => version.hashCode ^ forceUpdate.hashCode;

  @override
  String toString() {
    const encoder = JsonEncoder.withIndent('');
    final converted = encoder.convert(toJson());
    return converted.replaceAll(RegExp('[{}]'), '');
  }
}
