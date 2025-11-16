import '../models/SchoolNews.dart';
import 'api_client.dart';

class NewsService {
  final _apiService = ApiClient().apiService;

  Future<List<SchoolNews>> getNews() async {
    try {
      final response = await _apiService.getNews();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;

        return bodyList
            .where((json) => json != null)
            .map((json) {
          if (json is! Map<String, dynamic>) {
            return null;
          }
          try {
            return SchoolNews.fromJson(json);
          } catch (e) {
            return null;
          }
        })
            .whereType<SchoolNews>()
            .toList();
      } else {
        throw Exception('Failed to load news: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }

  Future<SchoolNews> getNewsItem(int id) async {
    try {
      final response = await _apiService.getNewsItem(id);

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! Map<String, dynamic>) {
          throw Exception('Expected a map but got ${body.runtimeType}');
        }

        return SchoolNews.fromJson(body as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load news item: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news item: $e');
    }
  }
}