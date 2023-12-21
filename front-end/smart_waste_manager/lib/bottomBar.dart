import 'package:flutter/material.dart';
import 'package:smart_waste_manager/calendar.dart';
import 'package:smart_waste_manager/map_page.dart';
import 'package:smart_waste_manager/profil_page.dart';

class MyBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  MyBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      backgroundColor: Colors.white,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Calendrier',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          label: 'Travail',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        )
      ],
    );
  }
}

class MyIndexedStack extends StatelessWidget {
  final int currentIndex;
  const MyIndexedStack({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: [
        MapPage(),
        CalendarPage(),
        Container(
          color: Colors.orange,
          child: const Center(
            child: Text('Page 3'),
          ),
        ),
        Profile(),
      ],
    );
  }
}
