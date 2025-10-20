import 'package:school_mobileapp/models/SchoolEvent.dart';
import 'api_client.dart';

class EventService {
  final _apiService = ApiClient().apiService;

  Future<List<SchoolEvent>> getEvents() async {
    final response = await _apiService.getEvents();

    if (response.isSuccessful && response.body != null) {
      return response.body!
          .map((json) => SchoolEvent.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  }

  Future<SchoolEvent> getEvent(int id) async {
    final response = await _apiService.getEvent(id);

    if (response.isSuccessful && response.body != null) {
      return SchoolEvent.fromJson(response.body!);
    } else {
      throw Exception('Failed to load event: ${response.statusCode}');
    }
  }
}