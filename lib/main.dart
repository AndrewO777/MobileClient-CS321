import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final dbFile = File(p.join(dir.path, 'school_app.sqlite'));

  if (await dbFile.exists()) {
    await dbFile.delete(); // delete old db for dev testing
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NERD Tech School',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A5ACD),
          primary: const Color(0xFF6A5ACD),
          secondary: const Color(0xFFA67CBA),
          surface: const Color(0xFFE6E6FA),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6A5ACD),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFE6E6FA),
          selectedItemColor: Color(0xFF6A5ACD),
          unselectedItemColor: Color(0xFFA67CBA),
          type: BottomNavigationBarType.fixed,
        ),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}