import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/forget_password/views/email_form_view.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/forget_password/views/email_sent_view.dart';
import 'package:aidra_drive/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({
    super.key,
  });

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final PageController _pageController = PageController();

  //TODO: HANDLE RESET PASSWORD LOGIC VIA BLOC

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO: replace static routing with go router solution
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
          vertical: 30.sp,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                Assets.headerLogoAssets,
                height: 30.sp,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  EmailFormView(),
                  EmailSentview(),
                ],
              ),
            ),
            _buildRedirectToSignInLabel(context),
            SizedBox(height: 30.sp)
          ],
        ),
      ),
    );
  }

  _buildRedirectToSignInLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Redirection to ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorPalette.grey,
                ),
          ),
          TextSpan(
            text: 'SignIn',
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
                    builder: (context) => const SignInScreen(),
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
