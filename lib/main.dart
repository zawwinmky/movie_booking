import 'package:flutter/material.dart';
import 'package:movie_booking/pages/main_page.dart';
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
      home: const MainPage(),
    );
  }
}
