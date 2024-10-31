import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatefulWidget {
  final List<AppBottomBarItem> items;

  final ValueChanged<int> onTabSelected;
  final int currentIndex;

  const CustomBottomBar({
    super.key,
    required this.items,
    required this.onTabSelected,
    required this.currentIndex,
  });

  @override
  State<StatefulWidget> createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  List<Widget> items = [];
  late int currentIsndex = widget.currentIndex;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      currentIsndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return Container(
      color: ColorPalette.antiFlashWhite,
      constraints: BoxConstraints(
        minHeight: 60.sp,
        maxHeight: 100.sp,
      ),
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.sp,
        color: ColorPalette.antiFlashWhite,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: 60.sp,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required AppBottomBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    // Color color = widget.currentIndex == index
    //     ? HomeScreen.isMainMenu
    //         ? widget.color
    //         : widget.selectedColor
    //     : widget.color;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   HomeScreen.isMainMenu = false;
          // });
          // AppUtil.printData("Main menu value ${HomeScreen.isMainMenu}");
          // onPressed(index);
        },
        child: SvgPicture.asset(
          item.icon,
          height: 25.sp,
          // ignore: deprecated_member_use
          color: widget.currentIndex != currentIsndex
              ? ColorPalette.lightGreen
              : ColorPalette.grey,
        ),
      ),
    );
  }
}

class AppBottomBarItem {
  final String icon;

  AppBottomBarItem({
    required this.icon,
  });
}
