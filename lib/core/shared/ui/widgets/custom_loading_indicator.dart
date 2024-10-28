import 'dart:math' as math show sin, pi;
import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadinIndicator extends StatelessWidget {
  const CustomLoadinIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: ModalBarrier(
            dismissible: false,
            color: ColorPalette.white.withOpacity(0.8),
          ),
        ),
        const Center(
          child: SpinKitPulsingGrid(),
        ),
      ],
    );
  }
}

class SpinKitPulsingGrid extends StatefulWidget {
  const SpinKitPulsingGrid({super.key});

  @override
  State<SpinKitPulsingGrid> createState() => _SpinKitPulsingGridState();
}

class _SpinKitPulsingGridState extends State<SpinKitPulsingGrid>
    with SingleTickerProviderStateMixin {
  static const _gridCount = 3;

  late AnimationController _controller;

  final size = 50.sp;

  @override
  void initState() {
    super.initState();

    _controller = (AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    ))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(size),
        child: Stack(
          children: List.generate(_gridCount * _gridCount, (i) {
            final row = (i / _gridCount).floor();
            final column = i % _gridCount;
            final mid = i == (_gridCount * _gridCount - 1) / 2;
            final position = size * .7;
            final delay = mid
                ? .25
                : i.isOdd
                    ? .5
                    : .75;

            return Positioned.fill(
              left: position * (-1 + column),
              top: position * (-1 + row),
              child: Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: DelayTween(
                      begin: 0.0,
                      end: 1.0,
                      delay: delay,
                    ).animate(_controller),
                    curve: Curves.easeOut,
                  ),
                  child: SizedBox.fromSize(
                    size: Size.square(size / 4),
                    child: _itemBuilder(i),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => const DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.lightGreen,
          shape: BoxShape.circle,
        ),
      );
}

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
