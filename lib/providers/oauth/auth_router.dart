import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/splash_page.dart';
import '../../pages/login_page.dart';
import '../../pages/home_page.dart';
import '../../pages/news_page.dart';
import '../../pages/events_page.dart';
import '../../pages/cafeteria_page.dart';
import '../../pages/about_page.dart';

import '../../widgets/main_scaffold.dart';
import 'auth_controller_provider.dart';

final authRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,

    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) =>
            LoginPage(from: state.uri.queryParameters['from']),
      ),

      // All authenticated routes live inside MainScaffold
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/news',
            name: 'news',
            builder: (context, state) => const NewsPage(),
          ),
          GoRoute(
            path: '/events',
            name: 'events',
            builder: (context, state) => const EventsPage(),
          ),
          GoRoute(
            path: '/cafeteria',
            name: 'cafeteria',
            builder: (context, state) => const CafeteriaPage(),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            builder: (context, state) => const AboutPage(),
          ),
          // Announcements route if we want it
          // GoRoute(
          //   path: '/announcements',
          //   name: 'announcements',
          //   builder: (context, state) => const HomePage(),
          // ),
        ],
      ),
    ],

    // CENTRALIZED AUTH REDIRECT LOGIC
    redirect: (context, state) {
      final isSplash = state.uri.path == '/splash';
      final isLoggingIn = state.uri.path == '/login';

      // Any route that's not splash/login is considered protected
      final isProtected = !isSplash && !isLoggingIn;

      final bool isAuthenticated = authState.value ?? false;

      // While we're checking auth on startup, stay on splash
      if (authState.isLoading) {
        return isSplash ? null : '/splash';
      }

      // Not authenticated
      if (!isAuthenticated) {
        // If we're on splash and not loading, go to login
        if (isSplash) return '/login';

        // If already on login, stay there
        if (isLoggingIn) return null;

        // For protected routes, send to login and remember where we came from
        final from = state.matchedLocation;
        return '/login?from=$from';
      }

      // Authenticated
      // If we're still on splash or login, send to home
      if (isSplash || isLoggingIn) return '/';

      // Otherwise, stay where we are
      return null;
    },
  );
});
