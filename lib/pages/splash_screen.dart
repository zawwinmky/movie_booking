import 'package:flutter/material.dart';
import 'package:movie_booking/pages/choose_region_page.dart';
import 'package:movie_booking/pages/home_page.dart';
import 'package:movie_booking/pages/login_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delayFunction();

    // TODO: implement initState
    super.initState();
  }

  void delayFunction() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: Center(
        child: Image.asset(
          kLogo,
          width: kLogoWidth,
          height: kLogoHeight,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
