import 'package:aidra_drive/core/shared/ui/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Widget? body;
  const NavBarWrapper(this.navigationShell, {super.key, this.body});

  @override
  State<NavBarWrapper> createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        items: const [
          AppBottomBarItem(
            iconName: 'home',
            text: 'Home',
          ),
          AppBottomBarItem(
            iconName: 'bible',
            text: 'Bible',
          ),
          AppBottomBarItem(
            iconName: 'bookmark',
            text: 'Bookmarks',
          ),
          AppBottomBarItem(
            iconName: 'user',
            text: 'Profile',
          ),
        ],
        centerItemText: '',
        backgroundColor: const Color(0xFF34211d),
        color: const Color(0xFFfeefba),
        selectedColor: const Color(0xFFe6ac63),
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onTap,
        currentIndex: _selectedIndex,
      ),
      body: widget.navigationShell,
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
