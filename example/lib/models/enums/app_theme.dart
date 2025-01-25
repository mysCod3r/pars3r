import 'package:pars3r/pars3r.dart';

/// Enum representing the available app themes.
///
/// This enum defines three available themes: [light], [dark], and [system].
/// It is used for managing the app's theme setting in remote configuration.
enum AppTheme with IParsableEnum<AppTheme> {
  /// Represents the system default theme.
  system,

  /// Represents the light theme.
  light,

  /// Represents the dark theme.
  dark,
  ;

  @override
  List<AppTheme> get enumValues => values;
}
