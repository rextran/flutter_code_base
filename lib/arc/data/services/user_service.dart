import 'package:dio/dio.dart';

import '../../../src/core/resources/data_state.dart';
import '../../../src/core/services/base_service.dart';
import '../../data/apis/user_api.dart';
import '../../data/models/app_user.dart';

class UserSevice with DataStateConvertable {
  final UserApi _api;
  UserSevice(this._api);

  Future<DataState<List<AppUser>>> getUsers() async {
    try {
      final _response = await _api.getUsers();
      return convertToDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
