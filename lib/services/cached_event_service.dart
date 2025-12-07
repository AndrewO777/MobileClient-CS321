import '../database/database.dart';
import '../models/SchoolEvent.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';
import 'api_service.dart';

class CachedEventService {
  final ApiService _apiService;
  final AppDatabase _database;

  static const cacheDuration = Duration(hours: 1);

  CachedEventService(this._apiService, this._database);

  // Stream of events from database
  Stream<List<SchoolEvent>> watchEvents() {
    return _database.watchAllEvents().map((items) {
      return items.map((item) => _convertToSchoolEvent(item)).toList();
    });
  }

  // Refresh events from API
  Future<void> refreshEvents() async {
    try {
      final response = await _apiService.getEvents();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;
        final now = DateTime.now();

        final eventItems = bodyList
            .where((json) => json != null && json is Map<String, dynamic>)
            .map((json) {
          try {
            final schoolEvent = SchoolEvent.fromJson(json as Map<String, dynamic>);
            return EventItem(
              id: schoolEvent.id,
              title: schoolEvent.title,
              description: schoolEvent.description,
              start: schoolEvent.start,
              end: schoolEvent.end,
              campusId: schoolEvent.campusId,
              location: schoolEvent.location,
              cachedAt: now,
            );
          } catch (e) {
            print('Error parsing event item: $e');
            return null;
          }
        })
            .whereType<EventItem>()
            .toList();

        // Save to database
        await _database.insertAllEvents(eventItems);

        // Delete old cached items
        final threshold = now.subtract(cacheDuration);
        await _database.deleteOldEvents(threshold);
      }
    } catch (e) {
      print('Error refreshing events: $e');
      // Don't throw - allow offline access to cached data
    }
  }

  // Check if cache needs refresh
  Future<bool> needsRefresh() async {
    final items = await _database.getAllEvents();
    if (items.isEmpty) return true;

    final oldestCacheTime = items
        .map((item) => item.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final cacheAge = DateTime.now().difference(oldestCacheTime);
    return cacheAge > cacheDuration;
  }

  // Load events (from cache first, then refresh if needed)
  Future<void> loadEvents() async {
    final shouldRefresh = await needsRefresh();
    if (shouldRefresh) {
      await refreshEvents();
    }
  }

  SchoolEvent _convertToSchoolEvent(EventItem item) {
    return SchoolEvent(
      id: item.id,
      title: item.title,
      description: item.description,
      start: item.start,
      end: item.end,
      campusId: item.campusId,
      campus: null,
      location: item.location,
    );
  }
}