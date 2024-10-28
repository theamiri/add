import 'package:aidra_drive/core/shared/ui/screens/checkin_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/content_not_found_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/home_screen.dart';
import 'package:aidra_drive/core/shared/ui/screens/splash_screen.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  splash,
  signIn,
  forgetPassword,
  checkIn,
  home,
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
      case Routes.home:
        return '/home';
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
      case Routes.home:
        return GoRoute(
          path: route,
          builder: (context, state) => const HomeScreen(),
        );
      default:
        return GoRoute(
          path: route,
          builder: (context, state) => const ContentNotFoundScreen(),
        );
    }
  }
}
