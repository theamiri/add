import 'package:flutter/material.dart';

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
  final int currentIndex;

  const AppBottomBar({
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
  }) : assert(items.length == 2 || items.length == 4);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  void _updateIndex(int index) {
    widget.onTabSelected(index);
    // setState(() {
    //   HomeScreen.isMainMenu = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(widget.items.length, (int index) {
      return AppBottomBarTabItem(
        item: widget.items[index],
        index: index,
        iconSize: widget.iconSize,
        color: widget.color,
        selectedColor: widget.selectedColor,
        isSelected: widget.currentIndex == index,
        onPressed: _updateIndex,
      );
    });
    items.insert(
        items.length >> 1, AppBottomBarTabItem.buildMiddleTab(widget.height));

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
}

class AppBottomBarTabItem extends StatelessWidget {
  final AppBottomBarItem item;
  final int index;
  final double iconSize;
  final Color color;
  final Color selectedColor;
  final bool isSelected;
  final ValueChanged<int> onPressed;

  const AppBottomBarTabItem({
    super.key,
    required this.item,
    required this.index,
    required this.iconSize,
    required this.color,
    required this.selectedColor,
    required this.isSelected,
    required this.onPressed,
  });

  static Widget buildMiddleTab(double height) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected ? selectedColor : color;

    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(index),
        child: SizedBox(
          height: iconSize,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // AppUtil.getSVGImage(
                //   '${item.iconName}.svg',
                //   iconSize,
                //   iconSize,
                //   boxFit: BoxFit.fitHeight,
                //   color: itemColor,
                // ),
                // addVerticalSpace(kPadding4),
                Text(
                  item.text,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBottomBarItem {
  final String text;
  final String iconName;

  const AppBottomBarItem({
    required this.iconName,
    required this.text,
  });
}
