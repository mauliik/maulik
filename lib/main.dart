import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maulik/screens/accountScreen.dart';
import 'package:maulik/screens/exploreScreen.dart';
import 'package:maulik/screens/homeScreen.dart';

import 'screens/learnScreen.dart';

void main() {
  runApp(MyApp());
}

const primaryColor = Color(0xff8BC750);

class MyApp extends StatelessWidget {
  final List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const LearnScreen(),
    const AccountScreen(),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar Example',
      theme: ThemeData(
        textTheme:
            GoogleFonts.latoTextTheme(), // Use Lato font for the text theme
      ),
      home: MyBottomNavigationBar(screens),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final List<Widget> screens;

  const MyBottomNavigationBar(this.screens, {super.key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/homeicon.svg',
              color: _currentIndex == 0 ? primaryColor : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explore.svg',
              color: _currentIndex == 1 ? primaryColor : Colors.black,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/learn.svg',
              color: _currentIndex == 2 ? primaryColor : Colors.black,
            ),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              color: _currentIndex == 3 ? primaryColor : Colors.black,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
