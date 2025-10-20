import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService{

  //School Endpoints
  @GET(path: 'School')
  Future<Response<List<Map<String, dynamic>>>> getSchools();

  @GET(path: 'School/{id}')
  Future<Response<Map<String, dynamic>>> getSchool(@Path('id') int id);

  //Announcement Endpoints
  @GET(path: 'Announcement')
  Future<Response<List<Map<String, dynamic>>>> getAnnouncements();

  @GET(path: 'Announcement/{id}')
  Future<Response<Map<String, dynamic>>> getAnnouncement(@Path('id') int id);

  //News Endpoints
  @GET(path: 'News')
  Future<Response<List<Map<String, dynamic>>>> getNews();

  @GET(path: 'News/{id}')
  Future<Response<Map<String, dynamic>>> getNewsItem(@Path('id') int id);

  //Events Endpoints
  @GET(path: 'SchoolEvent')
  Future<Response<List<Map<String, dynamic>>>> getEvents();

  @GET(path: 'SchoolEvent/{id}')
  Future<Response<Map<String, dynamic>>> getEvent(@Path('id') int id);

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://10.0.2.2:5153/v1'),
      services: [
        _$ApiService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ApiService(client);
  }
}