import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/extension/padding_extensions.dart';
import 'package:aidra_drive/core/router/routes.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(Assets.headerLogoAssets),
          Placeholder(fallbackHeight: 200.sp),
          Text(
            'Thanks for your daily environmental impact🙏\nlet’s check in and start our day ',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorPalette.grey, height: 1.7.sp),
          ),
          CustomActionSlider(
            action: (actionSlider) {
              //TODO: impl logic behide sliding the check in button
              context.go(Routes.home.route);
            },
            title: 'CHECK IN',
          ),
        ],
      ).applyDefaultScaffoldPadding,
    );
  }
}