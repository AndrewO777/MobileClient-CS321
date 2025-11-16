import '../database/database.dart';
import '../models/CafeteriaItem.dart' as model;
import '../models/CafeteriaMenu.dart';
import 'api_client.dart';

class CachedCafeteriaService {
  final AppDatabase _database;
  final _apiService = ApiClient().apiService;

  static const cacheDuration = Duration(hours: 1);

  CachedCafeteriaService(this._database);

  // Stream of cafeteria items from database
  Stream<List<model.CafeteriaItem>> watchCafeteriaItems() {
    return _database.watchAllCafeteriaItems().map((items) {
      return items.map((item) => _convertToCafeteriaItem(item)).toList();
    });
  }

  // Refresh cafeteria items from API
  Future<void> refreshCafeteriaItems() async {
    try {
      final response = await _apiService.getCafeteriaMenus();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;
        final now = DateTime.now();

        // Extract all items from all menus
        final allItems = <CafeteriaItem>[];

        for (var menuJson in bodyList) {
          if (menuJson is Map<String, dynamic>) {
            try {
              final menu = CafeteriaMenu.fromJson(menuJson);

              for (var item in menu.menuItems) {
                allItems.add(CafeteriaItem(
                  id: item.id,
                  category: item.category.index,
                  name: item.name,
                  description: item.description,
                  iconName: item.iconName,
                  menuId: menu.id,
                  cachedAt: now,
                ));
              }
            } catch (e) {
              print('Error parsing menu: $e');
            }
          }
        }

        await _database.insertAllCafeteriaItems(allItems);

        final threshold = now.subtract(cacheDuration);
        await _database.deleteOldCafeteriaItems(threshold);
      }
    } catch (e) {
      print('Error refreshing cafeteria items: $e');
    }
  }

  Future<bool> needsRefresh() async {
    final items = await _database.getAllCafeteriaItems();
    if (items.isEmpty) return true;

    final oldestCacheTime = items
        .map((item) => item.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final cacheAge = DateTime.now().difference(oldestCacheTime);
    return cacheAge > cacheDuration;
  }

  Future<void> loadCafeteriaItems() async {
    final shouldRefresh = await needsRefresh();
    if (shouldRefresh) {
      await refreshCafeteriaItems();
    }
  }

  model.CafeteriaItem _convertToCafeteriaItem(CafeteriaItem item) {
    return model.CafeteriaItem(
      id: item.id,
      category: model.MenuCategory.values[item.category],
      name: item.name,
      description: item.description,
      iconName: item.iconName,
    );
  }
}