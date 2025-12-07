import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/fcm_token_service.dart';

/// Provider for FcmTokenService with authentication support
final fcmTokenServiceProvider = Provider<FcmTokenService>((ref) {
  return FcmTokenService.create(ref);
});