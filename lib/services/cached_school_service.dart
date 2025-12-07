import '../database/database.dart';
import '../models/School.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';
import 'api_service.dart';

class CachedSchoolService {
  final ApiService _apiService;
  final AppDatabase _database;

  static const cacheDuration = Duration(hours: 1);

  CachedSchoolService(this._apiService, this._database);

  // Stream of school from database
  Stream<School?> watchSchool() {
    return _database.watchSchool().map((item) {
      return item != null ? _convertToSchool(item) : null;
    });
  }

  // Refresh school from API
  Future<void> refreshSchool() async {
    try {
      final response = await _apiService.getSchools();

      if (response.isSuccessful && response.body != null && response.body!.isNotEmpty) {
        final schoolData = School.fromJson(response.body!.first);
        final now = DateTime.now();

        final schoolItem = SchoolItem(
          id: schoolData.id,
          name: schoolData.name,
          email: schoolData.email,
          website: schoolData.website,
          phoneNumber: schoolData.phoneNumber,
          cachedAt: now,
        );

        await _database.insertSchool(schoolItem);

        // Delete old cached items
        final threshold = now.subtract(cacheDuration);
        await _database.deleteOldSchool(threshold);
      }
    } catch (e) {
      print('Error refreshing school: $e');
    }
  }

  // Check if cache needs refresh
  Future<bool> needsRefresh() async {
    final item = await _database.getSchool();
    if (item == null) return true;

    final cacheAge = DateTime.now().difference(item.cachedAt);
    return cacheAge > cacheDuration;
  }

  // Load school (from cache first, then refresh if needed)
  Future<void> loadSchool() async {
    final shouldRefresh = await needsRefresh();
    if (shouldRefresh) {
      await refreshSchool();
    }
  }

  School _convertToSchool(SchoolItem item) {
    return School(
      id: item.id,
      name: item.name,
      email: item.email,
      website: item.website,
      phoneNumber: item.phoneNumber,
    );
  }
}