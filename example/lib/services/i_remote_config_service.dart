import 'package:pars3r/pars3r.dart';

/// A service that interacts with a remote configuration service to fetch
abstract class IRemoteConfigService {
  /// Default constructor for `IRemoteConfigService`.
  const IRemoteConfigService();

  /// Initializes the remote configuration service.
  Future<bool> initialize();

  /// Reads a remote configuration value for a specific key and parses it
  R read<T extends IParsableModel<T>, R>({
    required String key,
    required T parseModel,
  });
}
