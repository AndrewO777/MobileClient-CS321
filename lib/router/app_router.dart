import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/cafeteria_page.dart';
import '../pages/home_page.dart';
import '../pages/news_page.dart';
import '../pages/events_page.dart';
import '../widgets/main_scaffold.dart';
import '../pages/about_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/news',
            name: 'news',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: NewsPage(),
            ),
          ),
          GoRoute(
            path: '/events',
            name: 'events',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: EventsPage(),
            ),
          ),
          GoRoute(
            path: '/cafeteria',
            name: 'cafeteria',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CafeteriaPage(),
            ),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            builder: (context, state) => const AboutPage(),
          ),
        ],
      ),
    ],
  );
}