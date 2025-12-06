import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth_chopper/oauth_chopper.dart' as oc;

import 'config_provider.dart';
import 'storage_provider.dart';

/// Singleton OAuthChopper
final oauthChopperProvider = Provider<oc.OAuthChopper>((ref) {
  final cfg = ref.watch(oauthConfigProvider);
  final storage = ref.watch(oauthStorageProvider);

  final oauth = oc.OAuthChopper(
    authorizationEndpoint: Uri.parse(cfg.authorizationEndpoint),
    identifier: cfg.clientId,
    secret: cfg.clientSecret ?? null, // null for PKCE/native if required
    scopes: cfg.scopes,
    storage: storage,
  );

  ref.onDispose(() {
    // nothing special required; kept for symmetry/future hooks
  });

  return oauth;
});
