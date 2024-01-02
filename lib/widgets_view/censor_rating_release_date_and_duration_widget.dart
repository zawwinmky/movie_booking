import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
class CensorRatingReleaseDateAndDuration extends StatelessWidget {
  const CensorRatingReleaseDateAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CensorRatingAndDurationButtonView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingAndDurationButtonView(
          label: "Release Date",
          value: "May 8, 2022",
        ),
        CensorRatingAndDurationButtonView(
          label: "Duration",
          value: '2hr 18min',
        ),
      ],
    );
  }
}

class CensorRatingAndDurationButtonView extends StatelessWidget {
  final String label;
  final String value;

  const CensorRatingAndDurationButtonView(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginCardMedium2),
        gradient: const LinearGradient(colors: [
          kMovieDetailsCensorStartColor,
          kMovieDetailsCensorEndColor
        ]),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: kTextSmall,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: kTextRegular,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}