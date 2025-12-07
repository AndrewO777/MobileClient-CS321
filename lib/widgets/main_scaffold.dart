import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/oauth/auth_controller_provider.dart';

class MainScaffold extends ConsumerWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location == '/') return 0;
    if (location.startsWith('/news')) return 1;
    if (location.startsWith('/events')) return 2;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/news');
        break;
      case 2:
        context.go('/events');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.school, size: 24),
            SizedBox(width: 8),
            Text('NERD Tech School'),
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF6A5ACD),
                    const Color(0xFFA67CBA),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/school_logo.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              accountName: const Text(
                'NERD Tech School',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text('Empowering Tomorrow\'s NERDs'),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF6A5ACD)),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper, color: Color(0xFF6A5ACD)),
              title: const Text('News'),
              onTap: () {
                Navigator.pop(context);
                context.go('/news');
              },
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Color(0xFF6A5ACD)),
              title: const Text('Events'),
              onTap: () {
                Navigator.pop(context);
                context.go('/events');
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Color(0xFF6A5ACD)),
              title: const Text('Cafeteria'),
              onTap: () {
                Navigator.pop(context);
                context.go('/cafeteria');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF6A5ACD)),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                context.go('/about');
              },
            ),
            const AboutListTile(
              icon: Icon(Icons.info, color: Color(0xFF6A5ACD)),
              applicationName: 'NERD Tech School App',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2025 NERD Tech School',
              aboutBoxChildren: [
                SizedBox(height: 10),
                Text('A comprehensive mobile application for students!'),
              ],
              child: Text('About This App'),
            ),

            const Divider(),

            // LOG OUT
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF6A5ACD)),
              title: const Text('Log out'),
              onTap: () async {
                Navigator.pop(context); // close the drawer

                await ref
                    .read(authControllerProvider.notifier)
                    .signOut(); // clears token + sets state to false

                context.go('/login');
              },
            ),
          ],
        ),
      ),

      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}