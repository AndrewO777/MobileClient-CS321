import 'api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chopper/chopper.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final ApiService apiService;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    apiService = ApiService.create();
  }
}

/// Global Riverpod provider that exposes the shared ChopperClient
final apiClientProvider = Provider<ChopperClient>((ref) {
  // Access your singleton
  final apiClient = ApiClient();
  // Return the internal Chopper client from ApiService
  return apiClient.apiService.client;
});
