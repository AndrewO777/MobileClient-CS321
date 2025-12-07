import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_interceptor.dart';

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
  @GET(path: 'Events')
  Future<Response<List<Map<String, dynamic>>>> getEvents();

  @GET(path: 'Events/{id}')
  Future<Response<Map<String, dynamic>>> getEvent(@Path('id') int id);

  //Cafeteria Endpoints
  @GET(path: 'Cafeteria')
  Future<Response<List<Map<String, dynamic>>>> getCafeteriaMenus();

  @GET(path: 'Cafeteria/{id}')
  Future<Response<Map<String, dynamic>>> getCafeteriaMenu(@Path('id') int id);

  /// Create ApiService with authentication support
  ///
  /// Pass in a Ref from Riverpod to enable bearer token authentication
  static ApiService create(Ref ref) {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://10.0.2.2:8080/v1'),
      services: [
        _$ApiService(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        AuthInterceptor(ref),  // Adds bearer token to requests
        HttpLoggingInterceptor(),
      ],
    );
    return _$ApiService(client);
  }
}