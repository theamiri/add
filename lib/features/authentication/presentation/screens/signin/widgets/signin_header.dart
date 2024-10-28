import 'package:aidra_drive/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          Assets.headerLogoAssets,
          height: 30.sp,
        ),
        SizedBox(height: 35.sp),
        Center(
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}
