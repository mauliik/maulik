import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maulik/screens/account_screen.dart';
import 'package:maulik/screens/explore_screen.dart';
import 'package:maulik/screens/home_screen.dart';
import 'package:maulik/screens/learn_screen.dart';

void main() => runApp(MyApp());

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
      title: 'Bottom Navigation Bar',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: MaulikBottomNavigationBar(screens),
    );
  }
}

class MaulikBottomNavigationBar extends StatefulWidget {
  final List<Widget> screens;

  const MaulikBottomNavigationBar(this.screens, {super.key});

  @override
  State<MaulikBottomNavigationBar> createState() =>
      _MaulikBottomNavigationBarState();
}

class _MaulikBottomNavigationBarState extends State<MaulikBottomNavigationBar> {
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
              colorFilter: ColorFilter.mode(
                _currentIndex == 0 ? primaryColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explore.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 1 ? primaryColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/learn.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 2 ? primaryColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 3 ? primaryColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
