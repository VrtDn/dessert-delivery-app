import 'package:dessert_delivery_app/main_page.dart';
import 'package:dessert_delivery_app/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_page.dart';
import 'favorite_page.dart';
import 'ice_cream_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MainPage(data: widget.data),
          const FavoritePage(),
          const CardPage(),
          ProfilePage(data: widget.data),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/icons/home_icon.png",
              color: const Color(0xffFFADC6),
            ),
            icon: Image.asset(
              "assets/icons/home_icon.png",
              color: const Color(0xff7851A1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/icons/favorite_icon.png",
              color: const Color(0xffFFADC6),
            ),
            icon: Image.asset(
              "assets/icons/favorite_icon.png",
              color: const Color(0xff7851A1),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/icons/card_icon.png",
              color: const Color(0xffFFADC6),
            ),
            icon: Image.asset(
              "assets/icons/card_icon.png",
              color: const Color(0xff7851A1),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/icons/profile_icon.png",
              color: const Color(0xffFFADC6),
            ),
            icon: Image.asset(
                "assets/icons/profile_icon.png",
              color: const Color(0xff7851A1),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

