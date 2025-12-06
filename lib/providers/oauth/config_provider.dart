import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Central config (swap to .env or flavors if you like)
final oauthConfigProvider = Provider<_OAuthConfig>((ref) {
  const resource = 'http://school-api';

  return const _OAuthConfig(
    authorizationEndpoint:
        'https://usr3ww.logto.app/oidc/auth?resource=$resource',
    tokenEndpoint: 'https://usr3ww.logto.app/oidc/token?resource=$resource',
    clientId: 'meynbm2wd3p9c7xvky86q',
    // clientSecret: 'YOUR_CLIENT_SECRET', // Not needed for PKCE
    redirectUri: 'io.logto://callback',
    scopes: ['school:read', 'school:write', 'offline_access'],
    apiBaseUrl: 'http://10.0.2.2:5153',
  );
});

class _OAuthConfig {
  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String clientId;
  final String? clientSecret;
  final String redirectUri;
  final List<String> scopes;
  final String apiBaseUrl;
  const _OAuthConfig({
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.clientId,
    this.clientSecret,
    required this.redirectUri,
    required this.scopes,
    required this.apiBaseUrl,
  });
}
