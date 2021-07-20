import 'package:flutter/material.dart';

import '../constants/route_constants.dart';
import '../constants/constants.dart';
import '../../arc/presentation/views/views.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // final _phone = settings.arguments as String;
      case RouteConstants.home:
        return _materialRoute(const HomeView());
      case RouteConstants.api:
        return _materialRoute(const ApiView());
      case RouteConstants.cached:
        return _materialRoute(const CachedView());
      default:
        return null;
    }
  }

  static List<Route> onGenerateInitialRoute() {
    return [_materialRoute(const HomeView())];
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
