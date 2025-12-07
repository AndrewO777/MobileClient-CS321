import '../database/database.dart';
import '../models/SchoolNews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';
import 'api_service.dart';

class CachedNewsService {
  final ApiService _apiService;
  final AppDatabase _database;

  static const cacheDuration = Duration(hours: 1);

  CachedNewsService(this._apiService, this._database);

  // Stream of news from database
  Stream<List<SchoolNews>> watchNews() {
    return _database.watchAllNews().map((items) {
      return items.map((item) => _convertToSchoolNews(item)).toList();
    });
  }

  // Refresh news from API
  Future<void> refreshNews() async {
    try {
      final response = await _apiService.getNews();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;
        final now = DateTime.now();

        final newsItems = bodyList
            .where((json) => json != null && json is Map<String, dynamic>)
            .map((json) {
          try {
            final schoolNews = SchoolNews.fromJson(json as Map<String, dynamic>);
            return NewsItem(
              id: schoolNews.id,
              headline: schoolNews.headline,
              content: schoolNews.content,
              datePublished: schoolNews.datePublished,
              author: schoolNews.author,
              schoolId: schoolNews.schoolId,
              cachedAt: now,
            );
          } catch (e) {
            print('Error parsing news item: $e');
            return null;
          }
        })
            .whereType<NewsItem>()
            .toList();

        // Save to database
        await _database.insertAllNews(newsItems);

        // Delete old cached items
        final threshold = now.subtract(cacheDuration);
        await _database.deleteOldNews(threshold);
      }
    } catch (e) {
      print('Error refreshing news: $e');
      // Don't throw - allow offline access to cached data
    }
  }

  // Check if cache needs refresh
  Future<bool> needsRefresh() async {
    final items = await _database.getAllNews();
    if (items.isEmpty) return true;

    final oldestCacheTime = items
        .map((item) => item.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final cacheAge = DateTime.now().difference(oldestCacheTime);
    return cacheAge > cacheDuration;
  }

  // Load news (from cache first, then refresh if needed)
  Future<void> loadNews() async {
    final shouldRefresh = await needsRefresh();
    if (shouldRefresh) {
      await refreshNews();
    }
  }

  SchoolNews _convertToSchoolNews(NewsItem item) {
    return SchoolNews(
      id: item.id,
      headline: item.headline,
      content: item.content,
      datePublished: item.datePublished,
      author: item.author,
      schoolId: item.schoolId,
      school: null,
    );
  }
}