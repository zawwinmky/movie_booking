import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

import '../widgets_view/choose_movie_time_grid_view_widget.dart';

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
            ChooseMovieTimesGridExpandView(
              cinemaName: "JCGV: Junction City",
              isExpanded: true,
            ),
            ChooseMovieTimesGridExpandView(
              cinemaName: "JCGV: Junction Square",
              isExpanded: false,
            ),
            ChooseMovieTimesGridExpandView(
              cinemaName: "Mingala Ocean",
              isExpanded: false,
            ),
            ChooseMovieTimesGridExpandView(
              cinemaName: "JCGV: Junction Mawtin",
              isExpanded: false,
            ),
            ChooseMovieTimesGridExpandView(
              cinemaName: "Mingala Cineplex",
              isExpanded: false,
            ),
          ],
        ),
      ),
    );
  }
}
