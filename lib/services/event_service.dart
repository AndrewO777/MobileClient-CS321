import 'package:school_mobileapp/models/SchoolEvent.dart';
import 'api_client.dart';

class EventService {
  final _apiService = ApiClient().apiService;

  Future<List<SchoolEvent>> getEvents() async {
    try {
      final response = await _apiService.getEvents();

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! List) {
          throw Exception('Expected a list but got ${body.runtimeType}');
        }

        final List<dynamic> bodyList = body as List<dynamic>;

        return bodyList
            .where((json) => json != null)
            .map((json) {
          if (json is! Map<String, dynamic>) {
            return null;
          }
          try {
            return SchoolEvent.fromJson(json);
          } catch (e) {
            return null;
          }
        })
            .whereType<SchoolEvent>()
            .toList();
      } else {
        throw Exception('Failed to load events: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }

  Future<SchoolEvent> getEvent(int id) async {
    try {
      final response = await _apiService.getEvent(id);

      if (response.isSuccessful && response.body != null) {
        final body = response.body;

        if (body is! Map<String, dynamic>) {
          throw Exception('Expected a map but got ${body.runtimeType}');
        }

        return SchoolEvent.fromJson(body as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load event: ${response.error ?? response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load event: $e');
    }
  }
}