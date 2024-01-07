import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_booking/pages/cinema_selection_page.dart';
import 'package:movie_booking/pages/splash_screen.dart';
import 'package:movie_booking/testpage.dart';
import 'package:movie_booking/utils/fonts.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
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
    );
  }
}

// flutter clean;flutter pub get;cd ios;pod install;pod update;cd ..;
