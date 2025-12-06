import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
import 'services/notification_manager.dart';

// Background message handler - MUST be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('🔔 Background message received!');
  print('Message ID: ${message.messageId}');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Data: ${message.data}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup FCM background handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize notification manager (handles token registration)
  await NotificationManager().initialize();

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeFirebaseMessaging();
  }

  Future<void> _initializeFirebaseMessaging() async {
    // Request notification permissions (required for iOS, harmless on Android)
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('📱 Notification permission status: ${settings.authorizationStatus}');

    // Handle foreground messages (when app is open and in use)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('🔔 Foreground message received!');
      print('Message ID: ${message.messageId}');

      if (message.notification != null) {
        print('Title: ${message.notification!.title}');
        print('Body: ${message.notification!.body}');

        // Show a dialog or snackbar for foreground notifications
        _showNotificationDialog(
          message.notification!.title ?? 'Notification',
          message.notification!.body ?? '',
        );
      }

      if (message.data.isNotEmpty) {
        print('Data: ${message.data}');
        // Handle custom data here
      }
    });

    // Handle notification taps when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🔔 Notification tapped! (from background)');
      print('Data: ${message.data}');

      // Navigate to a specific screen based on notification data
      _handleNotificationTap(message);
    });

    // Check if app was opened from a terminated state by tapping notification
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print('🔔 App opened from terminated state via notification!');
      print('Data: ${initialMessage.data}');

      // Handle the initial notification that opened the app
      _handleNotificationTap(initialMessage);
    }
  }

  void _showNotificationDialog(String title, String body) {
    // Just print for foreground - system notifications are better anyway
    print('📬 Notification: $title - $body');

    // Optional: Show a SnackBar instead of dialog
    final context = AppRouter.router.routerDelegate.navigatorKey.currentContext;
    if (context != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title: $body'),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'View',
            onPressed: () {
              // Handle tap
            },
          ),
        ),
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    // Example: Navigate based on notification data
    // You can customize this based on your app's routing structure

    if (message.data.containsKey('route')) {
      String route = message.data['route'];
      print('📍 Navigating to: $route');

      // Example routing logic:
      // - If route is 'events', navigate to events page
      // - If route is 'news', navigate to news page
      // - etc.

      // You'll need to implement this based on your app's router
      // For example, using go_router:
      // AppRouter.router.go('/$route');

      if (message.data.containsKey('id')) {
        // AppRouter.router.go('/$route/${message.data['id']}');
      }
    }
  }

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