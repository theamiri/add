import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomSnackBar {
  static displayError(
    final BuildContext context,
    final Failure failure,
  ) {
    switch (failure) {
      case ServerFailure():
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar(
            context: context,
            color: ColorPalette.red,
            message: failure.message,
          ),
        );
        break;

      case NetworkFailure():
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar(
            context: context,
            color: ColorPalette.orange,
            message: failure.message,
          ),
        );
        break;
      case CacheFailure():
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar(
            context: context,
            color: ColorPalette.grey,
            message: failure.message,
          ),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar(
            context: context,
            color: ColorPalette.red,
            message: failure.message,
          ),
        );
        break;
    }
  }

  static displaySuccess(
    final BuildContext context,
    final String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(
        context: context,
        color: ColorPalette.lightGreen,
        message: message,
      ),
    );
  }

  static _buildSnackBar({
    required String message,
    required Color color,
    required BuildContext context,
  }) {
    return SnackBar(
      content: Row(
        children: [
          SizedBox(
            height: 30,
            child: VerticalDivider(
              color: color,
              thickness: 3,
            ),
          ),
          SizedBox(width: 7.sp),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
      backgroundColor: color.withOpacity(0.3),
      elevation: 0.0,
      duration: const Duration(milliseconds: 600),
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.all(30.sp),
      behavior: SnackBarBehavior.floating,
    );
  }
}
