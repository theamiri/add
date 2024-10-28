import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailSentview extends StatelessWidget {
  const EmailSentview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            Assets.envolope,
            height: 150.sp,
          ),
          SizedBox(height: 40.sp),
          Text(
            'Check Your Email',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: 30.sp),
          Text(
            'The password was sent to your email\nspecified during registration ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorPalette.grey,
                  fontSize: 13.sp,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
