import '../models/Announcement.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/api_service_provider.dart';

class AnnouncementService {
  final Ref ref;
  late final _apiService = ref.read(apiServiceProvider);

  AnnouncementService(this.ref);

  Future<Announcement> getAllAnnouncements() async {
    final response = await _apiService.getAnnouncements();

    if (response.isSuccessful && response.body != null && response.body!.isNotEmpty) {
      return Announcement.fromJson(response.body!.first);
    } else {
      throw Exception('Failed to load announcement info: ${response.statusCode}');
    }
  }

  Future<Announcement> getAnnouncement(int announcementId) async {
    final response = await _apiService.getAnnouncement(announcementId);

    if (response.isSuccessful && response.body != null) {
      return Announcement.fromJson(response.body!);
    } else {
      throw Exception('Failed to load announcement: ${response.statusCode}');
    }
  }
}