import 'package:flutter/material.dart';
import 'package:resala/views/screen/about/about_screen.dart';
import 'package:resala/views/screen/home/home_screen.dart';
import 'package:resala/views/screen/profile/profile_screen.dart';
import 'package:resala/views/widget/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  List pages = [
    const HomeScreen(),
    const AboutScreen(),
    const ProfileScreen(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainRedColor,
        unselectedItemColor: AppColors.hintTextColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'رساله'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'حول'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'انا'),
        ],
      ),
    );
  }
}
