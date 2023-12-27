import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Home Page",style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}