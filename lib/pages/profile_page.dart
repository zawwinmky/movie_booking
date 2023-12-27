import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Profile",style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
