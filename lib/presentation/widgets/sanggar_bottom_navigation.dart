import 'package:flutter/material.dart';
import 'package:sanggar_budaya/presentation/screen/favorite_screen.dart';
import 'package:sanggar_budaya/presentation/screen/home_screen.dart';
import 'package:sanggar_budaya/presentation/screen/profile_screen.dart';

class SanggarBottomNavigation extends StatefulWidget {
  final int? initialIndex;

  const SanggarBottomNavigation({super.key, required this.initialIndex});

  @override
  State<SanggarBottomNavigation> createState() =>
      _SanggarBottomNavigationState();
}

class _SanggarBottomNavigationState extends State<SanggarBottomNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoriteScreen(
              favorite: [],
            ),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
