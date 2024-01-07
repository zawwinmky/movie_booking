import 'package:flutter/material.dart';
import 'package:movie_booking/pages/cinemas_page.dart';
import 'package:movie_booking/pages/home_page.dart';
import 'package:movie_booking/pages/profile_page.dart';
import 'package:movie_booking/pages/tickets_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

import '../utils/fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> homeScreenWidgets = [
    const HomePage(),
    const CinemaPage(),
    const TicketsPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreenWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: _getBottomNavigationBarItems(),
        currentIndex: currentIndex,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottomUnselectedColor,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Image.asset(
            kMovieIcon,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          activeIcon: Image.asset(
            kMovieIcon,
            color: kPrimaryColor,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          label: kMovieLabel),
      BottomNavigationBarItem(
          icon: Image.asset(
            kCinemaIcon,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          activeIcon: Image.asset(
            kCinemaIcon,
            color: kPrimaryColor,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          label: kCinemasLabel),
      BottomNavigationBarItem(
          icon: Image.asset(
            kTicketIcon,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          activeIcon: Image.asset(
            kTicketIcon,
            color: kPrimaryColor,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          label: kTicketsLabel),
      BottomNavigationBarItem(
          icon: Image.asset(
            kProfileIcon,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          activeIcon: Image.asset(
            kProfileIcon,
            color: kPrimaryColor,
            height: kMarginXLarge,
            width: kMargin30,
          ),
          label: kProfileLabel),
    ];
  }
}
