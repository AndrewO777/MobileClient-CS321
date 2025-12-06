import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/splash_page.dart';
import '../../pages/login_page.dart';
import '../../pages/home_page.dart';
import '../../pages/events_page.dart';
import 'auth_controller_provider.dart';

/// Main GoRouter provider using Riverpod.
final authRouterProvider = Provider<GoRouter>((ref) {
  // Watch auth so that router rebuilds / re-evaluates redirects on change.
  ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/',

    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder:
            (context, state) =>
                LoginPage(from: state.uri.queryParameters['from']),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(), // Placeholder
      ),
      GoRoute(
        path: '/announcements',
        name: 'announcements',
        builder: (context, state) => const EventsPage(),
      ),

      // Add other routes here...
    ],

    /// Centralized AuthGuard logic.
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);

      final isSplash = state.uri.path == '/splash';
      final isLoggingIn = state.uri.path == '/login';

      // Which routes require auth?
      final bool isProtectedRoute = _isProtectedPath(state.uri.path);

      // 1) While we're bootstrapping auth, stay on /splash.
      if (auth.isLoading) {
        // Already on splash? Stay there.
        if (isSplash) return null;
        // Anywhere else? Go to splash until we know our auth state.
        return '/splash';
      }

      // If there was an error during bootstrap, you might decide to:
      // - Treat it as not-authenticated, or
      // - Show an error page.
      // Here we just treat it like "not authenticated".
      final bool isAuthenticated = (auth.value == true);

      // 2) Not authenticated → block protected routes.
      if (!isAuthenticated) {
        if (isProtectedRoute) {
          // Remember the original destination so we can go back after login.
          final from = state.uri.toString();
          return '/login?from=$from';
        }

        // Public routes (/login, maybe some others) are allowed.
        return null;
      }

      // 3) Authenticated → don’t stay on /login or /splash.
      if (isLoggingIn || isSplash) {
        // If we have a "from" query param, go there; otherwise go home.
        final from = state.uri.queryParameters['from'];
        if (from != null && from.isNotEmpty) {
          return from;
        }
        return '/';
      }

      // 4) Authenticated and going somewhere allowed → no redirect.
      return null;
    },
  );
});

/// Helper: define which paths are protected.
/// You can adjust this to match your app’s route structure.
bool _isProtectedPath(String path) {
  // This is a good use of a switch statement.  There, I said it!
  bool requiresAuth = false;

  // Add the cases for those that require auth.  All others don't
  switch (path) {
    // case ('/'): // If requiring login to start using the app
    case ('/announcements'):
      requiresAuth = true;
      break;
    default:
      requiresAuth = false;
      break;
  }

  return requiresAuth;
}
