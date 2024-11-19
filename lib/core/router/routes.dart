import 'package:aidra_drive/core/shared/ui/screens/content_not_found_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/main_menu_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/splash_screen.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/checkin_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  splash,
  signIn,
  forgetPassword,
  checkIn,
  mainMenu,
  contentNotFound,
}

extension RoutesExtension on Routes {
  String get route {
    switch (this) {
      case Routes.splash:
        return '/';
      case Routes.signIn:
        return '/signIn';
      case Routes.forgetPassword:
        return '/forget_password';
      case Routes.checkIn:
        return '/checkin';
      case Routes.mainMenu:
        return '/main_menu';
      default:
        return '/content_not_found';
    }
  }
}

extension BuildRoutes on Routes {
  GoRoute get build {
    switch (this) {
      case Routes.splash:
        return GoRoute(
          path: route,
          builder: (context, state) => const SplashScreen(),
        );
      case Routes.signIn:
        return GoRoute(
          path: route,
          builder: (context, state) => const SignInScreen(),
        );
      case Routes.forgetPassword:
        return GoRoute(
          path: route,
          builder: (context, state) => const ForgetPasswordScreen(),
        );
      case Routes.checkIn:
        return GoRoute(
          path: route,
          builder: (context, state) => const CheckInScreen(),
        );
      case Routes.mainMenu:
        return GoRoute(
          path: route,
          builder: (context, state) => const MainMenuScreen(),
        );
      default:
        return GoRoute(
          path: route,
          builder: (context, state) => const ContentNotFoundScreen(),
        );
    }
  }
}
