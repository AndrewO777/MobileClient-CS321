import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth_chopper/oauth_chopper.dart';

class SecureOAuthStorage implements OAuthStorage {
  static const _key = 'oauth_credentials_json';
  final FlutterSecureStorage _ss = const FlutterSecureStorage();

  @override
  Future<void> clear() async {
    await _ss.delete(key: _key);
  }

  @override
  Future<String?> fetchCredentials() async {
    final value = await _ss.read(key: _key);

    // Optional: debug log
    // print('Fetched stored OAuth credentials: $value');
    return value;
  }

  @override
  Future<void> saveCredentials(String? credentialsJson) async {
    // Only prints in developer environment
    if (kDebugMode) {
      print('Saving OAuth credentials: $credentialsJson');
    }

    if (credentialsJson == null) {
      await _ss.delete(key: _key);
    } else {
      await _ss.write(key: _key, value: credentialsJson);
    }
  }
}