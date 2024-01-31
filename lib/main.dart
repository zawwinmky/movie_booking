import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_booking/network/data_agent/dio_data_agent_impl.dart';
import 'package:movie_booking/network/data_agent/http_data_agent_impl.dart';
import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';
import 'package:movie_booking/pages/splash_screen.dart';
import 'package:movie_booking/utils/fonts.dart';

void main() {
  MovieBookingDataAgent dataAgent = HttpDataAgentImpl();
  dataAgent.getNowPlayingMovieList(1);
  // HttpDataAgentImpl().getNowPlayingMovieList(1);
  // DioDataAgentImpl().getNowPlayingMovieList(1);
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
