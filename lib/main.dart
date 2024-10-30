import 'dart:io';
import 'package:aidra_drive/core/constant/strings.dart';
import 'package:aidra_drive/core/storage/hive/hive_adapters.dart';
import 'package:aidra_drive/core/router/auth_listener_wrapper.dart';
import 'package:aidra_drive/core/router/router.dart';
import 'package:aidra_drive/core/shared/ui/theme/light_theme.dart';
import 'package:aidra_drive/core/shared/ui/theme/theme_utils.dart';
import 'package:aidra_drive/core/utils/http_overrider.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.init();
  ThemeUtils.changeSystemUIOverlayStyle();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await HiveAdapters.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AuthListenerWrapper(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: Strings.appTitle.toUpperCase(),
            themeMode: ThemeMode.light,
            theme: lightTheme,
            builder: (context, child) => child!,
          ),
        );
      },
    );
  }
}
