import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_remote_config_example/services/index.dart';
import 'package:pars3r/pars3r.dart';

/// A service that interacts with Firebase Remote Config to fetch and parse
/// remote configuration values.
///
/// The [FirebaseRemoteConfigService] manages the connection with Firebase's
/// Remote Config and provides methods to initialize the service and fetch
/// values for specific keys. This service implements [IParsableService] to
/// parse values into the appropriate model types.
final class FirebaseRemoteConfigService extends IRemoteConfigService
    with IParsableService {
  /// Private constructor for creating a [FirebaseRemoteConfigService] with
  /// a specific [remoteConfig].
  ///
  /// This constructor is used internally and is private to ensure the use of
  /// the singleton pattern to only create a single instance of the service.
  FirebaseRemoteConfigService({FirebaseRemoteConfig? remoteConfig})
      : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  @override
  Future<bool> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await _remoteConfig.fetchAndActivate();
      return _remoteConfig.lastFetchStatus == RemoteConfigFetchStatus.success;
    } catch (_) {
      return false;
    }
  }

  @override
  R read<T extends IParsableModel<T>, R>({
    required String key,
    required T parseModel,
  }) {
    try {
      final stringValue = _remoteConfig.getString(key);
      final value = super.parser<T, R>(parseModel, stringValue);
      return value;
    } catch (_) {
      rethrow;
    }
  }
}
