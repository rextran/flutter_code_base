import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'injector.dart';
import 'src/config/app_config.dart';
import 'arc/presentation/blocs/app/app_bloc.dart';
import 'src/config/app_routes.dart';
import 'src/config/app_theme.dart';
import 'src/constants/constants.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().configApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<AppBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        onGenerateInitialRoutes: (_) => AppRoutes.onGenerateInitialRoute(),
        theme: AppTheme.light,
        builder: EasyLoading.init(),
      ),
    );
  }
}
