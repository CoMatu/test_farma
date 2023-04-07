import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_farma/common/router/app_router.dart';

typedef OnShowDrawer = VoidCallback;

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    Key? key,
    required this.beamerKey,
    required this.onShowDrawer,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;
  final OnShowDrawer onShowDrawer;

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    widget.beamerKey.currentState?.routerDelegate
        .addListener(() => _updateCurrentIndex());
    super.initState();
  }

  @override
  void dispose() {
    widget.beamerKey.currentState?.routerDelegate
        .removeListener(_updateCurrentIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        if (index < 2) {
          widget.beamerKey.currentState?.routerDelegate.beamToNamed(
              index == 0 ? AppPages.contacts.path : AppPages.favorites.path);
          // .beamToNamed(index == 0 ? '/contacts' : '/favorites');
        } else {
          widget.onShowDrawer.call();
        }
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Контакты',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Меню',
        ),
      ],
    );
  }

  void _updateCurrentIndex() {
    final index =
        (widget.beamerKey.currentState?.currentBeamLocation is ContactsLocation)
            ? 0
            : (widget.beamerKey.currentState?.currentBeamLocation
                    is FavoritesLocation)
                ? 1
                : -1;
    if (index != _currentIndex && index >= 0) {
      setState(() => _currentIndex = index);
    }
  }
}
