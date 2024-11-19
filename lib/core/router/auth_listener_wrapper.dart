import 'package:aidra_drive/core/router/router.dart';
import 'package:aidra_drive/core/router/routes.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthListenerWrapper extends StatelessWidget {
  final Widget child;
  const AuthListenerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthenticatedState || current is UnauthenticatedState,
      listener: (context, state) {
        if (state is AuthenticatedState) {
          //TODO: CHANGE BACK TO CHECK IN SCREEN IN PRODUCTION
          router.go(Routes.mainMenu.route);
        } else if (state is UnauthenticatedState) {
          router.go(Routes.mainMenu.route);
        }
      },
      child: child,
    );
  }
}
