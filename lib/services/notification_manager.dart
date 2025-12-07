import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/fcm_token_service_provider.dart';

/// Manages Firebase Cloud Messaging tokens and backend synchronization
class NotificationManager {
  final Ref ref;
  late final _fcmTokenService = ref.read(fcmTokenServiceProvider);

  String? _currentToken;
  String? _deviceId;

  NotificationManager(this.ref);

  /// Initialize notification manager and register token with backend
  Future<void> initialize() async {
    // Get device ID
    _deviceId = await _getDeviceId();

    // Get FCM token
    _currentToken = await FirebaseMessaging.instance.getToken();

    if (_currentToken != null && _deviceId != null) {
      print('🔑 FCM Token: $_currentToken');
      print('📱 Device ID: $_deviceId');

      // Send to backend
      await _registerTokenWithBackend(_currentToken!, _deviceId!);
    }

    // Listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print('🔄 FCM Token refreshed: $newToken');
      _currentToken = newToken;

      if (_deviceId != null) {
        _updateTokenOnBackend(newToken, _deviceId!);
      }
    });
  }

  /// Get a unique device identifier
  Future<String> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // Unique Android ID
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? 'unknown-ios-device';
    } else {
      return 'unknown-device';
    }
  }

  /// Register token with backend (first time)
  Future<void> _registerTokenWithBackend(String token, String deviceId) async {
    try {
      final response = await _fcmTokenService.registerToken({
        'token': token,
        'deviceId': deviceId,
        'platform': Platform.isAndroid ? 'android' : 'ios',
        'registeredAt': DateTime.now().toIso8601String(),
      });

      if (response.isSuccessful) {
        print('✅ FCM token registered with backend');
      } else {
        print('❌ Failed to register FCM token: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error registering FCM token: $e');
      // Don't throw - app should continue even if backend registration fails
    }
  }

  /// Update token on backend (when token refreshes)
  Future<void> _updateTokenOnBackend(String token, String deviceId) async {
    try {
      final response = await _fcmTokenService.updateToken(
        deviceId,
        {
          'token': token,
          'updatedAt': DateTime.now().toIso8601String(),
        },
      );

      if (response.isSuccessful) {
        print('✅ FCM token updated on backend');
      } else {
        print('❌ Failed to update FCM token: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error updating FCM token: $e');
    }
  }

  /// Delete token from backend (call on logout)
  Future<void> deleteToken() async {
    if (_deviceId == null) {
      print('⚠️ No device ID available to delete token');
      return;
    }

    try {
      final response = await _fcmTokenService.deleteToken(_deviceId!);

      if (response.isSuccessful) {
        print('✅ FCM token deleted from backend');
        _currentToken = null;
      } else {
        print('❌ Failed to delete FCM token: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error deleting FCM token: $e');
    }
  }

  /// Get the current FCM token
  String? get currentToken => _currentToken;

  /// Get the device ID
  String? get deviceId => _deviceId;
}