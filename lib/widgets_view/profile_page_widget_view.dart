import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';

import '../utils/dimensions.dart';
import '../utils/fonts.dart';

class ProfilePageWidgetListView extends StatelessWidget {
  const ProfilePageWidgetListView(
      {super.key,
      required this.iconLabel,
      required this.kImage,
      this.isBorder = true});

  final String iconLabel;
  final bool isBorder;
  final String kImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isBorder
            ? const Border(
                bottom: BorderSide(
                width: 1,
                color: kBottomBorderProfilePage,
              ))
            : const Border(
                bottom: BorderSide.none,
              ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: kMargin22),
      padding: const EdgeInsets.symmetric(vertical: kMargin20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            kImage,
            width: kMargin30,
            height: kMargin30,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: kMargin10,
          ),
          Text(
            iconLabel,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kTextRegular2X,
              fontFamily: kInter,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: kMargin20,
            color: kColor444,
          ),
        ],
      ),
    );
  }
}
