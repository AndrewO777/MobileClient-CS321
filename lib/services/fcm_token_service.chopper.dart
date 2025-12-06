// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$FcmTokenService extends FcmTokenService {
  _$FcmTokenService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = FcmTokenService;

  @override
  Future<Response<Map<String, dynamic>>> registerToken(
      Map<String, dynamic> tokenData) {
    final Uri $url = Uri.parse('FCMToken');
    final $body = tokenData;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> updateToken(
    String deviceId,
    Map<String, dynamic> tokenData,
  ) {
    final Uri $url = Uri.parse('FCMToken/${deviceId}');
    final $body = tokenData;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<void>> deleteToken(String deviceId) {
    final Uri $url = Uri.parse('FCMToken/${deviceId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }
}
