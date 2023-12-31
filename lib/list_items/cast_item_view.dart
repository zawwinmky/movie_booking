import 'package:flutter/material.dart';
import 'package:movie_booking/utils/dimensions.dart';

class CastItemView extends StatelessWidget {
  const CastItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kMarginMedium2),
      child: ClipOval(
        child: Image.network(
          'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/817EwvvPsDL.jpg',
          width: kMargin60,
          height: kMargin60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
