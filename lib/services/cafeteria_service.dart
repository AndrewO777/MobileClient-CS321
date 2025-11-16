import '../models/CafeteriaMenu.dart';
import 'api_client.dart';

class CafeteriaService {
  final _apiService = ApiClient().apiService;

  Future<List<CafeteriaMenu>> getMenus() async {
    try {
      final response = await _apiService.getCafeteriaMenus();

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
            return CafeteriaMenu.fromJson(json);
          } catch (e) {
            return null;
          }
        })
            .whereType<CafeteriaMenu>()
            .toList();
      } else {
        throw Exception('Failed to load menus: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load menus: $e');
    }
  }

  Future<CafeteriaMenu> getMenu(int id) async {
    try {
      final response = await _apiService.getCafeteriaMenu(id);

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! Map<String, dynamic>) {
          throw Exception('Expected a map but got ${body.runtimeType}');
        }

        return CafeteriaMenu.fromJson(body as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load menu: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load menu: $e');
    }
  }
}