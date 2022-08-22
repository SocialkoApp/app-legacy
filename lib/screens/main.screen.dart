import 'package:app/screens/home.screen.dart';
import 'package:app/screens/profile.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<dynamic> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  final List<SalomonBottomBarItem> _items = [
    SalomonBottomBarItem(
      icon: const Icon(IconlyLight.home),
      title: const Text('Home'),
      selectedColor: AppAssets.colors.secondary,
    ),
    SalomonBottomBarItem(
      icon: const Icon(IconlyLight.profile),
      title: const Text('Profile'),
      selectedColor: AppAssets.colors.secondary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        color: AppAssets.colors.background,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: _items,
        ),
      ),
    );
  }
}
