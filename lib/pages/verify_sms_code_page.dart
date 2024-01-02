import 'package:flutter/material.dart';
import 'package:movie_booking/pages/main_page.dart';
import 'package:movie_booking/utils/colors.dart';

class VerifySmsCode extends StatefulWidget {
  const VerifySmsCode({super.key});

  @override
  State<VerifySmsCode> createState() => _VerifySmsCodeState();
}

class _VerifySmsCodeState extends State<VerifySmsCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const MainPage();
              }));
            },
            child: const Text("GO to Main Pgae")),
      )),
    );
  }
}
