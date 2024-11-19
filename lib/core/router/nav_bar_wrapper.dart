import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class NavBarWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Widget? body;
  const NavBarWrapper(this.navigationShell, {super.key, this.body});

  @override
  State<NavBarWrapper> createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButton: Material(
        color: ColorPalette.tiffanyBlue,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: () {},
          child: SizedBox(
            width: 55.sp,
            height: 55.sp,
            child: Icon(
              Icons.dashboard,
              color: ColorPalette.white,
              size: 30.sp,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        shadow: const BoxShadow(
          blurRadius: 10,
          color: ColorPalette.grey,
          offset: Offset(0, 3),
        ),
        height: 50.sp,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        gapWidth: 85.sp,
        iconSize: 26.sp,
        notchMargin: 12,
        inactiveColor: ColorPalette.grey.withOpacity(0.7),
        activeColor: ColorPalette.tiffanyBlue,
        icons: const [
          Icons.speed,
          Icons.school,
          Icons.notifications,
          Icons.settings,
        ],
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {},
        //other params
      ),
    );
  }
}
