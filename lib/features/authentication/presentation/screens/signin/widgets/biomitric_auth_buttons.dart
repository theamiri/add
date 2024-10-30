import 'dart:io';

import 'package:aidra_drive/core/constant/assets.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:aidra_drive/core/utils/local_authenticator.dart';
import 'package:aidra_drive/features/authentication/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BiomitricAuthButtons extends StatefulWidget {
  const BiomitricAuthButtons({super.key});

  @override
  State<BiomitricAuthButtons> createState() => _BiomitricAuthButtonsState();
}

class _BiomitricAuthButtonsState extends State<BiomitricAuthButtons> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _buildBiomtricButton(
            onPressed: () {
              context.read<AuthBloc>().add(LoadUserCredentialsEvent());
            },
            svgAsset: Assets.faceId,
          )
        : _buildBiomtricButton(
            onPressed: () {
              context.read<AuthBloc>().add(LoadUserCredentialsEvent());
            },
            svgAsset: Assets.fingerPrint,
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
