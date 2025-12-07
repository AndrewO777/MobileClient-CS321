import '../database/database.dart';
import '../models/Announcement.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';
import 'api_service.dart';

class CachedAnnouncementService {
  final ApiService _apiService;
  final AppDatabase _database;

  static const cacheDuration = Duration(hours: 1);

  CachedAnnouncementService(this._apiService, this._database);

  // Stream of announcements from database
  Stream<List<Announcement>> watchAnnouncements() {
    return _database.watchAllAnnouncements().map((items) {
      return items.map((item) => _convertToAnnouncement(item)).toList();
    });
  }

  // Refresh announcements from API
  Future<void> refreshAnnouncements() async {
    try {
      final response = await _apiService.getAnnouncements();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;
        final now = DateTime.now();

        final announcementItems = bodyList
            .where((json) => json != null && json is Map<String, dynamic>)
            .map((json) {
          try {
            final announcement = Announcement.fromJson(json as Map<String, dynamic>);
            return AnnouncementItem(
              id: announcement.id,
              title: announcement.title,
              message: announcement.message,
              datePosted: announcement.datePosted,
              schoolId: announcement.schoolId,
              cachedAt: now,
            );
          } catch (e) {
            print('Error parsing announcement: $e');
            return null;
          }
        })
            .whereType<AnnouncementItem>()
            .toList();

        await _database.insertAllAnnouncements(announcementItems);

        final threshold = now.subtract(cacheDuration);
        await _database.deleteOldAnnouncements(threshold);
      }
    } catch (e) {
      print('Error refreshing announcements: $e');
    }
  }

  Future<bool> needsRefresh() async {
    final items = await _database.getAllAnnouncements();
    if (items.isEmpty) return true;

    final oldestCacheTime = items
        .map((item) => item.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final cacheAge = DateTime.now().difference(oldestCacheTime);
    return cacheAge > cacheDuration;
  }

  Future<void> loadAnnouncements() async {
    final shouldRefresh = await needsRefresh();
    if (shouldRefresh) {
      await refreshAnnouncements();
    }
  }

  Announcement _convertToAnnouncement(AnnouncementItem item) {
    return Announcement(
      id: item.id,
      title: item.title,
      message: item.message,
      datePosted: item.datePosted,
      schoolId: item.schoolId,
    );
  }
}