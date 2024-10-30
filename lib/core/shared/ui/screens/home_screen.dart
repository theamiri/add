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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      SignOutEvent(),
                    );
              },
              child: const Text('signOut'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print(
                  "forget the objectif of this app and been used to immutate",
                );
                // try {
                //   final LocalAuthentication auth = LocalAuthentication();
                //   final finalauth = await auth.authenticate(
                //     localizedReason:
                //         'Sign in using your biometrics for a faster, secure experience',
                //     options: const AuthenticationOptions(),
                //   );
                //   print(finalauth);
                // } catch (e) {
                //   print(e);
                // }
              },
              child: const Text('check authentication with biomtric'),
              //todo: to be removed from section 101
              //todo: imlpement a double function to produce a little safari authentication
            ),
          ],
        ),
      ),
    );
  }
}
