import 'package:flutter/material.dart';
import '../database/database_provider.dart';
import '../models/CafeteriaItem.dart' as model;
import '../services/cached_cafeteria_service.dart';
import '../database/database.dart';

class CafeteriaPage extends StatefulWidget {
  const CafeteriaPage({Key? key}) : super(key: key);

  @override
  _CafeteriaPageState createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
  late final CachedCafeteriaService _cafeteriaService;
  //late final AppDatabase _database;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    final database = DatabaseProvider.instance;
    _cafeteriaService = CachedCafeteriaService(database);
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _cafeteriaService.loadCafeteriaItems();
  }

  Future<void> _refreshCafeteria() async {
    setState(() => _isRefreshing = true);
    await _cafeteriaService.refreshCafeteriaItems();
    setState(() => _isRefreshing = false);
  }

  IconData _getIconData(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'restaurant':
        return Icons.restaurant;
      case 'local_drink':
        return Icons.local_drink;
      case 'fastfood':
        return Icons.fastfood;
      case 'local_pizza':
        return Icons.local_pizza;
      case 'lunch_dining':
        return Icons.lunch_dining;
      case 'eco':
        return Icons.eco;
      case 'grass':
        return Icons.grass;
      case 'coffee':
        return Icons.coffee;
      case 'bolt':
        return Icons.bolt;
      case 'water_drop':
        return Icons.water_drop;
      default:
        return Icons.restaurant_menu;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple.shade100,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/school_logo.png"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cafeteria",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_isRefreshing)
                        const SizedBox(
                          height: 12,
                          width: 12,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: StreamBuilder<List<model.CafeteriaItem>>(
            stream: _cafeteriaService.watchCafeteriaItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading menu',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _refreshCafeteria,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final allItems = snapshot.data ?? [];

              if (allItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restaurant, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No menu items available',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _refreshCafeteria,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Load Menu'),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: _refreshCafeteria,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    final item = allItems[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Icon(
                            _getIconData(item.iconName),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text(item.description),
                        trailing: Chip(
                          label: Text(
                            item.category.name.toUpperCase(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}