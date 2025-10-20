import '../models/SchoolNews.dart';
import 'api_client.dart';

class NewsService {
  final _apiService = ApiClient().apiService;

  Future<List<SchoolNews>> getNews() async {
    final response = await _apiService.getNews();

    if (response.isSuccessful && response.body != null) {
      return response.body!
          .map((json) => SchoolNews.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }

  Future<SchoolNews> getNewsItem(int id) async {
    final response = await _apiService.getNewsItem(id);

    if (response.isSuccessful && response.body != null) {
      return SchoolNews.fromJson(response.body!);
    } else {
      throw Exception('Failed to load news item: ${response.statusCode}');
    }
  }
}