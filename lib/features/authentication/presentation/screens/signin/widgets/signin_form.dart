import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_text_form_field.dart';
import 'package:aidra_drive/features/authentication/domain/entities/signin_req_entity.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  void _onSignInButtonClicked() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            SignInEvent(
              reqEntity: SignInRequestEntity(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is UserCredentialsLoadedState,
      listener: (context, state) {
        if (state is UserCredentialsLoadedState) {
          setState(() {
            _emailController.text = state.credentials.email;
            _passwordController.text = state.credentials.password;
          });
          _onSignInButtonClicked();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: 'Email',
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              suffixIcon: const Icon(Icons.mail_outline),
            ),
            SizedBox(height: 29.sp),
            CustomTextFormField(
              hintText: 'Password',
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              isObscure: isObscure,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.lock_outlined : Icons.lock_open_outlined,
                ),
              ),
            ),
            SizedBox(height: 20.sp),
            _buildForgetPasswordLabel(),
            SizedBox(height: 50.sp),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _onSignInButtonClicked,
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildForgetPasswordLabel() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Incorrect password? ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorPalette.grey,
                ),
          ),
          TextSpan(
            text: 'Forgot password',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorPalette.blue,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO: replace static routing with routing solution "gorouter"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordScreen(),
                  ),
                );
              },
          ),
        ],
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
