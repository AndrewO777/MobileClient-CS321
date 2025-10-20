import '../models/Announcement.dart';
import 'api_client.dart';

class AnnouncementService {
  final _apiService = ApiClient().apiService;

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