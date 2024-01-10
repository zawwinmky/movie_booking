import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  RangeValues _selectedRangeValues = const RangeValues(10, 70);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: RangeSlider(
              activeColor: kPrimaryColor,
              inactiveColor: kNowAndComingSelectedTextColor,
              min: 0,
              max: 100,
              labels: const RangeLabels("Hello", "There"),
              values: _selectedRangeValues,
              onChanged: (RangeValues values) {
                setState(() {
                  _selectedRangeValues = values;
                });
              }),
        ),
      ),
    );
  }
}
