import '../providers/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chopper/chopper.dart';

import 'api_service.dart';

/// API Client that creates ApiService instances with authentication support
class ApiClient {
  final Ref ref;
  late final ApiService apiService;

  ApiClient(this.ref) {
    apiService = ref.read(apiServiceProvider);
  }
}

/// Provider that creates ApiClient with auth support
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref);
});

/// Provider that exposes the ChopperClient
final chopperClientProvider = Provider<ChopperClient>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.apiService.client;
});