import 'package:evently/create_event_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/taps/favorite/favorite_tap.dart';
import 'package:evently/taps/home/home_tap.dart';
import 'package:evently/taps/profile/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [HomeTap(), FavoriteTap(), ProfileTap()];
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(child: taps[currentIndex]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateEventScreen.routeName);
        },
        child: Icon(Icons.add, size: 28),
      ),

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
            label: appLocalizations.home,
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
            label: appLocalizations.favorite,
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
            label: appLocalizations.profile,
          ),
        ],
      ),
    );
  }
}
