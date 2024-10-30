import 'package:aidra_drive/core/router/nav_bar_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.splash.route,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavBarWrapper(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            Routes.contentNotFound.build,
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            Routes.contentNotFound.build,
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            Routes.contentNotFound.build,
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            Routes.contentNotFound.build,
          ],
        ),
      ],
    ),
    Routes.splash.build,
    Routes.signIn.build,
    Routes.forgetPassword.build,
    Routes.checkIn.build,
    Routes.home.build,
    Routes.contentNotFound.build,
  ],
);
