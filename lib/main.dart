import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/cinmea_seat_grid_view.dart';
import 'package:movie_booking/models/test.dart';
import 'package:movie_booking/pages/choose_region_page.dart';
import 'package:movie_booking/pages/cinema_selection_page.dart';
import 'package:movie_booking/pages/grab_a_bite_page.dart';
import 'package:movie_booking/pages/login_page.dart';
import 'package:movie_booking/pages/main_page.dart';
import 'package:movie_booking/pages/movie_details_page.dart';
import 'package:movie_booking/pages/splash_screen.dart';
import 'package:movie_booking/test.dart';
import 'package:movie_booking/utils/fonts.dart';

void main() {
  runApp(const MovieBooking());
}

class MovieBooking extends StatelessWidget {
  const MovieBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kInter,
      ),
      home: const SplashScreen(),
      // home: TestPage(),
      // home:  GrabABite(),
      // home: const MovieDetailsPage(),
    );
  }
}

// flutter clean;flutter pub get;cd ios;pod install;pod update;cd ..;
