import 'package:aidra_drive/core/shared/ui/widgets/custom_snackbar.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticationFailureState) {
          CustomSnackBar.displayError(context, state.failure);
        }
        if (state is UnauthenticatedState) {
          CustomSnackBar.displaySuccess(context, 'Goodbye!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      SignOutEvent(),
                    );
              },
              child: const Text('signOut'),
            ),
          ),
        ),
      ),
    );
  }
}
