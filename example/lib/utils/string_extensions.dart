/// An extension on [String] that provides a method for converting a string
/// to snake_case format.
extension SnakeCaseExtension on String {
  /// Converts a string from camelCase or PascalCase to snake_case.
  ///
  /// Example:
  /// ```dart
  /// 'camelCaseString'.toSnakeCase(); // Returns 'camel_case_string'
  /// 'PascalCaseString'.toSnakeCase(); // Returns 'pascal_case_string'
  /// ```
  ///
  /// Returns:
  /// - A new string in snake_case format.
  String toSnakeCase() {
    final regex = RegExp('(?<=[a-z0-9])([A-Z])');
    return replaceAllMapped(regex, (match) => '_${match.group(0)}')
        .toLowerCase();
  }
}
