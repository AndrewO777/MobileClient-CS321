import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';
import '../services/cafeteria_service.dart';

final cafeteriaProvider = FutureProvider.autoDispose((ref) async {
  final client = ref.watch(apiClientProvider);
  final service = CafeteriaService.create(client);
  final response = await service.getCafeteriaItems();
  return response.body ?? [];
});

class CafeteriaPage extends ConsumerWidget {
  const CafeteriaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(cafeteriaProvider);

    return Scaffold(
      body: Column(
        children: [
          // ✅ Header (same as Events)
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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cafeteria",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Page content
          Expanded(
            child: asyncData.when(
              data: (items) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 8),
                  ...items.map((item) => ListTile(
                    leading: const Icon(Icons.restaurant_menu),
                    title: Text(item['name'] ?? 'Unnamed Item'),
                    subtitle: Text(item['description'] ?? 'No description'),
                    trailing: Text(
                      item['price'] != null ? '\$${item['price']}' : '',
                    ),
                  )),
                ],
              ),
              loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
