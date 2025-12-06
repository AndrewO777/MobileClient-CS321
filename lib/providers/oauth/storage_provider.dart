import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth_chopper/oauth_chopper.dart' as oc;

import '../../utilities/secure_oauth_storage.dart';

/// Secure credential storage for oauth_chopper
final oauthStorageProvider = Provider<oc.OAuthStorage>((ref) {
  return SecureOAuthStorage();
});
