import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/notification_manager.dart';

final notificationManagerProvider = Provider<NotificationManager>((ref) {
  return NotificationManager(ref);
});
