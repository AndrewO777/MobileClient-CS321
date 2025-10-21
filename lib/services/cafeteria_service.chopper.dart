// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafeteria_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CafeteriaService extends CafeteriaService {
  _$CafeteriaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CafeteriaService;

  @override
  Future<Response<List<Map<String, dynamic>>>> getCafeteriaItems() {
    final Uri $url = Uri.parse('/cafeteria');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }
}
