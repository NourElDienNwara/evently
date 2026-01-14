import 'package:evently/taps/favorite_tap.dart';
import 'package:evently/taps/home_tap.dart';
import 'package:evently/taps/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [
    HomeTap(),
    FavoriteTap(),
    ProfileTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: taps[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/unactive_home.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/active_home.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/unactive_heart.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/active_heart.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            label: 'Favorite',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/unactive_user.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/active_user.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
