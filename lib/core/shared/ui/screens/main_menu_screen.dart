import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.sp),
              child: SvgPicture.asset(Assets.headerLogoAssets),
            ),
            SizedBox(height: 20.sp),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.sp,
                mainAxisSpacing: 30.sp,
              ),
              children: [
                _buildMenuButton(
                  icon: Assets.todayScheduleIcon,
                  context: context,
                  route: Routes.contentNotFound.route,
                ),
                _buildMenuButton(
                    icon: Assets.transactionHistoryIcon,
                    context: context,
                    route: Routes.contentNotFound.route),
                _buildMenuButton(
                  icon: Assets.unloadigIcon,
                  context: context,
                  route: Routes.contentNotFound.route,
                ),
                _buildMenuButton(
                  icon: Assets.walletIcon,
                  context: context,
                  route: Routes.contentNotFound.route,
                ),
                _buildMenuButton(
                  icon: Assets.tasksIcon,
                  context: context,
                  route: Routes.contentNotFound.route,
                ),
                _buildMenuButton(
                  icon: Assets.hrIcon,
                  context: context,
                  route: Routes.contentNotFound.route,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required String icon,
    required BuildContext context,
    required String route,
  }) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: SvgPicture.asset(icon),
        ),
        Transform.translate(
          offset: const Offset(0, 0),
          child: SizedBox(
            height: 150.sp,
            width: 150.sp,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const SizedBox(),
            ),
          ),
        )
      ],
    );
  }
}
