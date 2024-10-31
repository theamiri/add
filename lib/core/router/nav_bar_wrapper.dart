import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NavBarWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Widget? body;
  const NavBarWrapper(this.navigationShell, {super.key, this.body});

  @override
  State<NavBarWrapper> createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80.sp,
        child: Stack(
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: ColorPalette.white, boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 2,
                  color: ColorPalette.grey,
                  offset: Offset(0, -5),
                ),
              ]),
            ),
            Transform.translate(
              offset: Offset(150.sp, -25.sp),
              child: SizedBox(
                height: 70.sp,
                width: 70.sp,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    side: const BorderSide(
                      color: Colors.white, // Border color
                      width: 10, // Border width
                    ),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    Assets.faceId,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: widget.navigationShell,
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
