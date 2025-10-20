import 'api_service.dart';

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