import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  final int index; 
  final Function(int?) onTap;
  const MyBottomBar ({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.notification_add_outlined), label: 'Notification'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_outlined), label: 'favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}