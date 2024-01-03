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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        title: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              kArrow,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: kMarginMedium,
            ),
            const Text(
              "Yangon",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: kTextRegular2X,
                fontFamily: kInter,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.search,
            size: kMarginLarge,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMarginXLarge,
          ),
          const Icon(
            Icons.notifications,
            size: kMarginLarge,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            kScanIcon,
            height: 55,
            width: 55,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          const SizedBox(
            width: 7,
          ),
        ],
      ),
      body: homeScreenWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
