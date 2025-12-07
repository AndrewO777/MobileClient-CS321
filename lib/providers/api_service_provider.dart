import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

/// Provider for ApiService with authentication support
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService.create(ref);
});