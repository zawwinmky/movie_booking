import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

import '../widgets_view/cinmea_over_view_widget_expandable.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CinemaOverViewWidget(
              cinemaName: "JCGV: Junction City",
              isExpanded: true,
            ),
            CinemaOverViewWidget(
              cinemaName: "JCGV: Junction Square",
              isExpanded: false,
            ),
            CinemaOverViewWidget(
              cinemaName: "Mingala Ocean",
              isExpanded: false,
            ),
            CinemaOverViewWidget(
              cinemaName: "JCGV: Junction Mawtin",
              isExpanded: false,
            ),
            CinemaOverViewWidget(
              cinemaName: "Mingala Cineplex",
              isExpanded: false,
            ),
          ],
        ),
      ),
    );
  }
}
