import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/cinmea_seat_grid_view.dart';
import 'package:movie_booking/models/seat_model.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/utils/text_style.dart';

class SeatSelectionPage extends StatefulWidget {
  SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  int acceptedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              acceptedValue.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Expanded(
              child: CinemaSeatGridView(
                onSeatSelection: (value) {
                  acceptedValue = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
