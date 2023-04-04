import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Меню',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Контакты',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Избранное',
        ),
      ],
    );
  }
}
