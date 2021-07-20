import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../injector.dart';
import '../constants/constants.dart';
import 'network_config.dart';

class AppConfig {
  static final AppConfig _appConfig = AppConfig._();
  factory AppConfig() {
    return _appConfig;
  }
  AppConfig._();

  Future<void> configApp() async {
    initDependencies();
    configLoading();
  }

  void initDependencies() {
    initializeDependencies(buildMode: BuildMode.dev);
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = ColorConstatns.whiteColor
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = ColorConstatns.blackColor.withOpacity(0.8)
      ..indicatorColor = ColorConstatns.whiteColor
      ..maskColor = ColorConstatns.blackColor.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
