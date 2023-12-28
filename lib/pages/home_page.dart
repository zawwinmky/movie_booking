import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        title: const Row(
          children: [
            SizedBox(
              width: kMarginMedium2,
            ),
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(
              width: kMarginMedium2,
            ),
            Text(
              "Yangon",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: kTextRegular2X,
                fontFamily: kInter,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.notifications,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.qr_code_scanner,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kHomeScreenAppbarRMargin,
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: const Center(
        child: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
