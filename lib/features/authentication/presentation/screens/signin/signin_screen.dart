import 'package:aidra_drive/core/extension/padding_extensions.dart';
import 'package:aidra_drive/core/shared/ui/screens/home_screen.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_loading_indicator.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_snackbar.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/widgets/biomitric_auth_buttons.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/widgets/signin_form.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/widgets/signin_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthenticatedState ||
          current is AuthenticationFailureState,
      listener: (context, state) {
        if (state is AuthenticationFailureState) {
          CustomSnackBar.displayError(context, state.failure);
        }
        if (state is AuthenticatedState) {
          CustomSnackBar.displaySuccess(
            context,
            'Welcome back!',
          );
          //TODO: NAVIGATE TO HOME SCREEN || use go router instead of built in routing soulution
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SignInHeader(),
                    SignInForm(),
                    BiomitricAuthButtons(),
                    //TODO: replace sizedbox with a language picker widget
                    SizedBox(),
                  ],
                ).applyDefaultScaffoldPadding,
                Visibility(
                  visible: state is AuthenticatingState,
                  child: const CustomLoadinIndicator(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
