import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Tickets Page",style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
