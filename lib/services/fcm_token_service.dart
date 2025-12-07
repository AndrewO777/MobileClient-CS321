import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_interceptor.dart';

part 'fcm_token_service.chopper.dart';

@ChopperApi()
abstract class FcmTokenService extends ChopperService {

  /// Register a new FCM token for this device
  ///
  /// POST /v1/FCMToken
  /// Body: { "token": "fcm-token-string", "deviceId": "unique-device-id" }
  @Post(path: 'FCMToken')
  Future<Response<Map<String, dynamic>>> registerToken(
      @Body() Map<String, dynamic> tokenData,
      );

  /// Update an existing FCM token
  ///
  /// PUT /v1/FCMToken/{deviceId}
  /// Body: { "token": "new-fcm-token-string" }
  @Put(path: 'FCMToken/{deviceId}')
  Future<Response<Map<String, dynamic>>> updateToken(
      @Path('deviceId') String deviceId,
      @Body() Map<String, dynamic> tokenData,
      );

  /// Delete FCM token (e.g., on logout)
  ///
  /// DELETE /v1/FCMToken/{deviceId}
  @Delete(path: 'FCMToken/{deviceId}')
  Future<Response<void>> deleteToken(
      @Path('deviceId') String deviceId,
      );

  /// Create the service instance with authentication support
  ///
  /// Pass in a Ref from Riverpod to enable bearer token authentication
  static FcmTokenService create(Ref ref) {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://10.0.2.2:8080/v1'),
      services: [
        _$FcmTokenService(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        AuthInterceptor(ref),  // Adds bearer token to requests
        HttpLoggingInterceptor(),
      ],
    );
    return _$FcmTokenService(client);
  }
}