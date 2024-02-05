import 'package:flutter/material.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CensorRatingReleaseDateAndDuration extends StatelessWidget {
  final MovieVO? movie;
  const CensorRatingReleaseDateAndDuration({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CensorRatingAndDurationButtonView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingAndDurationButtonView(
          label: "Release Date",
          value: movie?.getReleaseDate() ?? "",
        ),
        CensorRatingAndDurationButtonView(
          label: "Duration",
          value: movie?.getRunTimeFormat() ?? "",
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
