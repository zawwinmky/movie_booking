import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

class CinemasPage extends StatefulWidget {
  const CinemasPage({super.key});

  @override
  State<CinemasPage> createState() => _CinemasPageState();
}

class _CinemasPageState extends State<CinemasPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(

      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Cinemas",style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
