import 'package:chopper/chopper.dart';
part 'about_service.chopper.dart';

@ChopperApi(baseUrl: '/about')
abstract class AboutService extends ChopperService {
  @Get()
  Future<Response<Map<String, dynamic>>> getAboutData();

  static AboutService create([ChopperClient? client]) =>
      _$AboutService(client);
}
