import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../src/helper/helpers.dart';
import '../src/config/network_config.dart';

import '../arc/data/apis/user_api.dart';
import '../arc/data/services/services.dart';
import '../arc/presentation/blocs/blocs.dart';
import 'arc/data/local_db/app_database/app_database.dart';
import 'arc/data/local_db/daos/daos.dart';

final injector = GetIt.instance;

void initializeDependencies({required BuildMode buildMode}) {
  _initNetWork(buildMode: buildMode);
  _initApis();
  _initServices();
  _initBlocs();
  _initLocalDB();
}

void _initNetWork({required BuildMode buildMode}) {
  injector.registerSingleton<NetWorkMode>(NetWorkMode(mode: buildMode));

  injector.registerSingleton<CustomInterceptors>(CustomInterceptors());

  injector.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: injector<NetWorkMode>().baseUrl,
    connectTimeout: injector<NetWorkMode>().connectTimeout,
    receiveTimeout: injector<NetWorkMode>().receiveTimeout,
  ))
    ..interceptors.add(injector<CustomInterceptors>()));
}

void _initLocalDB() {
  injector.registerSingleton<AppDB>(AppDB());
  injector<AppDB>().initAppDB().then((_) => {
    injector.registerSingleton<AppUserDao>(injector<AppDB>().database.appUserDao)
  });
}

void _initApis() {
  injector.registerSingleton<UserApi>(UserApi(injector()));
}

void _initServices() {
  injector.registerSingleton<UserSevice>(UserSevice(injector()));
}

void _initBlocs() {
  injector.registerSingleton<AppBloc>(AppBloc());
  injector.registerFactory(() => UserBloc(injector(), injector()));
}
