import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MAIN MENU',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(Assets.lampIcon),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: SvgPicture.asset(Assets.headerLogoAssets),
          ),
          SizedBox(height: 20.sp),
          GridView(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.sp,
              mainAxisSpacing: 30.sp,
            ),
            children: [
              SvgPicture.asset(Assets.todayScheduleIcon),
              SvgPicture.asset(Assets.transactionHistoryIcon),
              SvgPicture.asset(Assets.unloadigIcon),
              SvgPicture.asset(Assets.walletIcon),
              SvgPicture.asset(Assets.tasksIcon),
              SvgPicture.asset(Assets.hrIcon),
            ],
          ),
        ],
      ),
    );
  }
}
