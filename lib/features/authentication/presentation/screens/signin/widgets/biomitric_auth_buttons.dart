import 'dart:io';
import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BiomitricAuthButtons extends StatelessWidget {
  const BiomitricAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBiomtricButton(
            onPressed: () {
              //TODO: perform a biomtric auth check to retrive password
            },
            svgAsset: Assets.fingerPrint,
          ),
          Visibility(
            visible: Platform.isIOS,
            child: SizedBox(width: 30.sp),
          ),
          Visibility(
            visible: Platform.isIOS,
            child: _buildBiomtricButton(
              onPressed: () {
                //TODO: perform a biomtric auth check to retrive password
              },
              svgAsset: Assets.faceId,
            ),
          ),
        ],
      ),
    );
  }

  _buildBiomtricButton({
    required Function()? onPressed,
    required String svgAsset,
  }) {
    return SizedBox(
      height: 60.sp,
      width: 60.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.antiFlashWhite,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: SvgPicture.asset(
          svgAsset,
          height: 32.sp,
        ),
      ),
    );
  }
}
