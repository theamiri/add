import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  Widget get applyDefaultScaffoldPadding {
    return Padding(
      padding: EdgeInsets.all(35.sp),
      child: this,
    );
  }
}
