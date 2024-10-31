import 'package:action_slider/action_slider.dart';
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActionSlider extends StatefulWidget {
  final Function(ActionSliderController) action;
  final String label;

  const CustomActionSlider({
    super.key,
    required this.action,
    required this.label,
  });

  @override
  State<CustomActionSlider> createState() => _CustomActionSliderState();
}

class _CustomActionSliderState extends State<CustomActionSlider> {
  ActionSliderController actionSliderController = ActionSliderController();
  @override
  void dispose() {
    actionSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ActionSlider.custom(
      boxShadow: const [
        BoxShadow(
          spreadRadius: 0,
          blurRadius: 0,
        ),
      ],
      width: MediaQuery.of(context).size.width,
      controller: actionSliderController,
      toggleWidth: 90.0.sp,
      sliderBehavior: SliderBehavior.move,
      height: 55.0.sp,
      backgroundColor: ColorPalette.antiFlashWhite,
      foregroundChild: Container(
        width: 100.sp,
        decoration: BoxDecoration(
          color: ColorPalette.antiFlashWhite,
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 6.sp,
            height: 20.sp,
            decoration: const BoxDecoration(
              color: ColorPalette.lightGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      ),
      foregroundBuilder: (context, state, child) => child!,
      backgroundChild: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              3,
              (index) => Icon(
                Icons.arrow_forward_ios_outlined,
                size: 11.sp,
                color: ColorPalette.grey,
              ),
            ),
          ),
          SizedBox(width: 10.sp),
          Text(
            widget.label.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.grey, fontSize: 14.sp),
          ),
        ],
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
    );
  }
}
