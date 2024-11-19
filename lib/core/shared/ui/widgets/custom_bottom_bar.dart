import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomBar extends StatefulWidget {
  final List<AppBottomBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  late int currentIndex;

  AppBottomBar({
    super.key,
    required this.items,
    required this.centerItemText,
    this.height = 60.0,
    this.iconSize = 25.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  @override
  State<StatefulWidget> createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {
  List<Widget> items = [];

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      widget.currentIndex = index;
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
      constraints: const BoxConstraints(
        minHeight: 60,
        maxHeight: 100,
      ),
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: widget.notchedShape,
        notchMargin: 12,
        color: widget.backgroundColor,
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
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
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
    bool isConditionValid = 1 == 1;
    Color color = widget.currentIndex == index
        ? isConditionValid
            ? widget.color
            : widget.selectedColor
        : widget.color;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isConditionValid = false;
          });
          onPressed(index);
        },
        child: SizedBox(
          height: widget.height,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  item.iconName,
                  height: widget.iconSize,
                  width: widget.iconSize,
                  color: color,
                ),
                SizedBox(height: 10.sp),
                Text(
                  item.text,
                  style: TextStyle(
                      color: color, fontSize: 11, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBottomBarItem {
  String text;
  final String iconName;

  AppBottomBarItem({
    required this.iconName,
    required this.text,
  });
}
