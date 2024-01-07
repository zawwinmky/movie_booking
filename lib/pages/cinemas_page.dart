import 'package:flutter/material.dart';
import 'package:movie_booking/pages/cinema_selection_page.dart';
import 'package:movie_booking/utils/colors.dart';

import '../utils/dimensions.dart';
import '../utils/fonts.dart';
import '../utils/strings.dart';
import '../widgets_view/choose_movie_time_grid_view_widget.dart';
import 'cinema_details_page.dart';
import 'cinema_seat_selection_page.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///App bar view
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(
              top: kMargin10, bottom: kMargin10, left: kMargin22),
          child: Image.asset(
            kArrow,
            width: kMargin28,
            height: kMargin28,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          "Yangon",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: kTextRegular2X,
            fontFamily: kInter,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          const Icon(
            Icons.search_sharp,
            size: kMargin22,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMarginXLarge,
          ),
          const Icon(
            Icons.notifications,
            size: kMargin22,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMargin22,
          ),
          Image.asset(
            kScanIconNew,
            height: kMargin55,
            width: kMargin55,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMargin18,
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: cinemasList.length,
                  itemBuilder: (context, index) {
                    return ChooseMovieTimesGridExpandView(
                        isExpanded: false, cinemaName: cinemasList[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> cinemasList = [
  "JCGV: Junction City",
  "JCGV: Junction Square",
  "Cineplex: Time Square",
  "Migala Cineplex",
  "Mingala Sein Gay Har"
];
