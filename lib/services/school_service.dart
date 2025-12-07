import '../models/School.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';

class SchoolService {
  final Ref ref;
  late final _apiService = ref.read(apiServiceProvider);

  SchoolService(this.ref);

  Future<School> getAllSchools() async {
    final response = await _apiService.getSchools();

    if (response.isSuccessful && response.body != null && response.body!.isNotEmpty) {
      return School.fromJson(response.body!.first);
    } else {
      throw Exception('Failed to load school info: ${response.statusCode}');
    }
  }

  Future<School> getSchool(int schoolId) async {
    final response = await _apiService.getSchool(schoolId);

    if (response.isSuccessful && response.body != null) {
      return School.fromJson(response.body!);
    } else {
      throw Exception('Failed to load school: ${response.statusCode}');
    }
  }
}