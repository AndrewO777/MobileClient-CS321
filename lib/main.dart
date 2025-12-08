import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

import 'providers/oauth/auth_router.dart';
import 'widgets/prominent_notification.dart';

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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  RemoteMessage? _lastMessage;  // Store the last message for routing

  @override
  void initState() {
    super.initState();
    _initializeFirebaseMessaging();
  }

  Future<void> _initializeFirebaseMessaging() async {
    // Request notification permissions (required for iOS, harmless on Android)
    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission(
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

        _lastMessage = message;  // Store for routing
        _showNotificationSnack(
          message.notification!.title ?? 'Notification',
          message.notification!.body ?? '',
        );
      }

      if (message.data.isNotEmpty) {
        print('Data: ${message.data}');
        // Handle custom data here if needed
      }
    });

    // Handle notification taps when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🔔 Notification tapped! (from background)');
      print('Data: ${message.data}');
      _handleNotificationTap(message);
    });

    // Check if app was opened from a terminated state by tapping notification
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print('🔔 App opened from terminated state via notification!');
      print('Data: ${initialMessage.data}');
      _handleNotificationTap(initialMessage);
    }
  }

  void _showNotificationSnack(String title, String body) {
    // Use the root navigator key which has overlay access
    final context = rootNavigatorKey.currentContext;

    if (context != null && mounted) {
      // Get the router for navigation
      final router = ref.read(authRouterProvider);

      ProminentNotification.show(
        context,
        title: title,
        body: body,
        icon: Icons.notifications_active,
        duration: const Duration(seconds: 5),
        onTap: () {
          print('Notification tapped: $title');

          // Use the message data to navigate intelligently
          if (_lastMessage != null) {
            _handleNotificationTap(_lastMessage!);
          } else {
            // Default: go to home
            router.go('/');
          }
        },
      );
    } else {
      print('📬 Notification: $title - $body');
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    // Route-based navigation using data payload
    final router = ref.read(authRouterProvider);

    // Check if there's routing data in the message
    if (message.data.containsKey('route')) {
      final route = message.data['route'] as String;
      print('📍 Navigating to: $route');

      // Navigate to the specified route
      router.go(route);

      // Handle additional parameters like IDs
      // if (message.data.containsKey('id')) {
      //   final id = message.data['id'];
      //   router.go('/$route/$id');
      // }
    } else {
      // Default routing based on notification content or type
      // You can add smart routing based on keywords in title/body
      final title = message.notification?.title?.toLowerCase() ?? '';

      if (title.contains('event')) {
        print('📍 Navigating to events');
        router.go('/events');
      } else if (title.contains('news')) {
        print('📍 Navigating to news');
        router.go('/news');
      } else if (title.contains('cafeteria') || title.contains('menu')) {
        print('📍 Navigating to cafeteria');
        router.go('/cafeteria');
      } else {
        // Default: go to home
        print('📍 Navigating to home');
        router.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the auth-aware GoRouter from Riverpod
    final router = ref.watch(authRouterProvider);

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
      routerConfig: router, // Use authRouterProvider
    );
  }
}