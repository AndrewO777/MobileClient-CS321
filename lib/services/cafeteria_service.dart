import 'package:chopper/chopper.dart';
part 'cafeteria_service.chopper.dart';

@ChopperApi(baseUrl: '/cafeteria')
abstract class CafeteriaService extends ChopperService {
  @Get()
  Future<Response<List<Map<String, dynamic>>>> getCafeteriaItems();

  static CafeteriaService create([ChopperClient? client]) =>
      _$CafeteriaService(client);
}
