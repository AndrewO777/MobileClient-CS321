// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AboutService extends AboutService {
  _$AboutService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AboutService;

  @override
  Future<Response<Map<String, dynamic>>> getAboutData() {
    final Uri $url = Uri.parse('/about');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
