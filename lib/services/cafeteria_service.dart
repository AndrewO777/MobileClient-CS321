import '../models/CafeteriaMenu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';

class CafeteriaService {
  final Ref ref;
  late final _apiService = ref.read(apiServiceProvider);

  CafeteriaService(this.ref);

  Future<List<CafeteriaMenu>> getMenus() async {
    try {
      final response = await _apiService.getCafeteriaMenus();

      print('Cafeteria Response successful: ${response.isSuccessful}');
      print('Cafeteria Response statusCode: ${response.statusCode}');
      print('Cafeteria Response body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          print('ERROR: Expected a list but got ${body.runtimeType}');
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;
        print('Cafeteria Body list length: ${bodyList.length}');

        final menus = bodyList
            .where((json) => json != null)
            .map((json) {
          if (json is! Map<String, dynamic>) {
            return null;
          }
          try {
            final menu = CafeteriaMenu.fromJson(json);
            print('Successfully parsed menu with ${menu.menuItems.length} items');
            return menu;
          } catch (e, stackTrace) {
            print('Error parsing menu: $e');
            print('Stack trace: $stackTrace');
            print('Problematic JSON: $json');
            return null;
          }
        })
            .whereType<CafeteriaMenu>()
            .toList();

        print('Final menus list length: ${menus.length}');
        return menus;
      } else {
        throw Exception('Failed to load menus: ${response.error ?? response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Exception in getMenus: $e');
      print('Stack trace: $stackTrace');
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