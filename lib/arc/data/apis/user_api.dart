import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../data/models/app_user.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET("/users")
  Future<HttpResponse<List<AppUser>>> getUsers();
}
