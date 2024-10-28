import 'package:action_slider/action_slider.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActionSlider extends StatefulWidget {
  final Function(ActionSliderController) action;

  final String title;

  const CustomActionSlider({
    super.key,
    required this.action,
    required this.title,
  });

  @override
  State<CustomActionSlider> createState() => _CustomActionSliderState();
}

class _CustomActionSliderState extends State<CustomActionSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ActionSlider.custom(
        toggleMargin: EdgeInsets.zero,
        width: 250.0,
        toggleWidth: 90.0,
        sliderBehavior: SliderBehavior.move,
        height: 60.0,
        backgroundColor: ColorPalette.antiFlashWhite,
        foregroundChild: Container(
          width: 100,
          decoration: BoxDecoration(
            color: ColorPalette.antiFlashWhite,
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 6,
              height: 20,
              decoration: BoxDecoration(
                color: ColorPalette.lightGreen.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
        ),
        foregroundBuilder: (context, state, child) => child!,
        backgroundChild: Padding(
          padding: EdgeInsets.only(right: 30.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 10.sp,
                    color: ColorPalette.grey,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 10.sp,
                    color: ColorPalette.grey,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 10.sp,
                    color: ColorPalette.grey,
                  ),
                ],
              ),
              SizedBox(width: 20.sp),
              Text(
                widget.title.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorPalette.grey,
                    ),
              ),
            ],
          ),
        ),
        backgroundBuilder: (context, state, child) => ClipRect(
            child: OverflowBox(
                maxWidth: state.standardSize.width,
                maxHeight: state.toggleSize.height,
                minWidth: state.standardSize.width,
                minHeight: state.toggleSize.height,
                child: child!)),
        backgroundBorderRadius: BorderRadius.circular(100.0),
        action: widget.action,
      ),
    );
  }
}
