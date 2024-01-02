import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/cinmea_seat_grid_view.dart';
import 'package:movie_booking/models/seat_model.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/utils/text_style.dart';

class SeatSelectionPage extends StatelessWidget {
  const SeatSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CinemaSeatGridView(),
      ),
    );
  }
}
