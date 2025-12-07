import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/oauth/chopper_provider.dart';

/// Interceptor that adds OAuth bearer token to all API requests
class AuthInterceptor implements Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  Future<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain,
      ) async {
    final oauth = ref.read(oauthChopperProvider);
    final token = await oauth.token;

    if (token != null) {
      final accessToken = token.accessToken;

      print('🔑 Adding bearer token to request: ${chain.request.url}');

      final request = applyHeader(
        chain.request,
        'Authorization',
        'Bearer $accessToken',
      );

      return chain.proceed(request);
    }

    print('⚠️ No auth token available for request: ${chain.request.url}');
    return chain.proceed(chain.request);
  }
}