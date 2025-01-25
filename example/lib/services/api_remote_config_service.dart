import 'dart:convert';

import 'package:firebase_remote_config_example/services/index.dart';
import 'package:http/http.dart' as http;
import 'package:pars3r/pars3r.dart';

/// A service that interacts with a backend API to fetch and parse
/// remote configuration values.
///
/// The [ApiRemoteConfigService] manages the connection with the backend
/// and provides methods to initialize the service and fetch values.
final class ApiRemoteConfigService extends IRemoteConfigService
    with IParsableService {
  /// Private constructor for creating a [ApiRemoteConfigService] with
  /// a specific [baseUrl] and [httpClient].
  ///
  /// This constructor is used internally to ensure proper initialization.
  ApiRemoteConfigService({
    this.baseUrl = 'http://localhost:3000',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Base URL for the backend API.
  final String baseUrl;

  /// HTTP client used for making requests.
  final http.Client _httpClient;

  Map<String, dynamic> _configs = {};

  @override
  Future<bool> initialize() async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$baseUrl/configs'),
        headers: {'Accept': 'application/json'},
      );
      _configs = jsonDecode(response.body) as Map<String, dynamic>;
      return true;
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
      final value = _configs[key];
      if (value == null) throw Exception('Value for key $key not found');
      return parseModel.parse(value.toString()) as R;
    } catch (_) {
      rethrow;
    }
  }
}
