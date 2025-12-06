import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth_chopper/oauth_chopper.dart' as oc;
import 'package:url_launcher/url_launcher.dart';

import '../providers/oauth/chopper_provider.dart';
import '../providers/oauth/config_provider.dart';
import '../providers/oauth/storage_provider.dart';

class AuthController extends StateNotifier<AsyncValue<bool>> {
  AuthController(this._ref) : super(const AsyncValue.loading()) {
    _bootstrap();
  }

  final Ref _ref;

  Future<void> _bootstrap() async {
    // Check if we already have stored credentials

    try {
      final oauth = _ref.read(oauthChopperProvider);
      final token = await oauth.token;
      state = AsyncValue.data(token != null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn() async {
    state = const AsyncValue.loading();

    final cfg = _ref.read(oauthConfigProvider);
    final oauth = _ref.read(oauthChopperProvider);

    final appLinks = AppLinks();

    // We'll complete this when we receive the redirect URI
    final completer = Completer<Uri>();

    // 1) Start listening for incoming links that match our redirectUri
    StreamSubscription<Uri>? sub;
    sub = appLinks.uriLinkStream.listen(
          (uri) {
        final expectedPrefix = cfg.redirectUri;
        if (uri.toString().startsWith(expectedPrefix)) {
          if (!completer.isCompleted) {
            completer.complete(uri);
          }
          sub?.cancel();
        }
      },
      onError: (err, stack) {
        if (!completer.isCompleted) {
          completer.completeError(err, stack);
        }
        sub?.cancel();
      },
    );

    // 2) Build the Authorization Code grant
    final grant = oc.AuthorizationCodeGrant(
      tokenEndpoint: Uri.parse(cfg.tokenEndpoint),
      redirectUrl: Uri.parse(cfg.redirectUri),

      // Called with the authorization URL: open system browser / custom tab
      redirect: (authorizationUri) async {
        await launchUrl(authorizationUri, mode: LaunchMode.externalApplication);
      },

      // Called when the browser redirects back into the app.
      // Here we just await the deep link we captured with app_links.
      listen: (redirectUri) async {
        final uri = await completer.future;
        print('Got deep link: $uri');
        return uri;
      },
    );

    try {
      final existingToken = await oauth.token;
      print('Before requestGrant – existing token: $existingToken');
      final token = await oauth.requestGrant(grant);
      // oauth_chopper persists token in your SecureOAuthStorage
      state = AsyncValue.data(token != null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      // Just in case we exit early, make sure the subscription is cleaned up
      if (sub != null) {
        await sub.cancel();
      }
    }
  }

  Future<void> signOut() async {
    final storage = _ref.read(oauthStorageProvider);
    await storage.clear();
    state = const AsyncValue.data(false);
  }
}