import 'package:flutter/material.dart';
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
    delayFunction(context);

    // TODO: implement initState
    super.initState();
  }

  void delayFunction(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
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
