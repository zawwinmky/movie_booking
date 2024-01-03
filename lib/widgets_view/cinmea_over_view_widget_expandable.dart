import 'package:flutter/material.dart';

import '../pages/cinema_details_page.dart';
import '../pages/grab_a_bite_page.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/fonts.dart';
import '../utils/strings.dart';

class CinemaOverViewWidget extends StatelessWidget {
  const CinemaOverViewWidget(
      {super.key, required this.isExpanded, required this.cinemaName});

  final bool isExpanded;
  final String cinemaName;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: kBackgroundColor,
      initiallyExpanded: isExpanded,
      trailing: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CinemaDetailsPage();
            }));
          },
          child: Text(
            "See Details",
            style: TextStyle(
              fontSize: kTextRegular2X,
              decoration: TextDecoration.underline,
              decorationColor: kPrimaryColor,
              color: kPrimaryColor,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
      title: Text(
        cinemaName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: kTextRegular2X,
          fontWeight: FontWeight.w600,
          fontFamily: kInter,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Image.asset(
              kParkingIcon,
              color: const Color(0xFFAAAAAA),
              width: kTextRegular2X,
              height: kTextRegular2X,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              "Parking",
              style: TextStyle(
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
                color: Color(0xFFAAAAAA),
              ),
            ),
            const SizedBox(
              width: kTextRegular2X,
            ),
            Image.asset(
              kCartIcon,
              color: const Color(0xFFAAAAAA),
              width: kTextRegular2X,
              height: kTextRegular2X,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              "Food",
              style: TextStyle(
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
                color: Color(0xFFAAAAAA),
              ),
            ),
            const SizedBox(
              width: kTextRegular2X,
            ),
            Image.asset(
              kWheelChair,
              color: const Color(0xFFAAAAAA),
              width: kTextRegular2X,
              height: kTextRegular2X,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              "Wheel Chair",
              style: TextStyle(
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
                color: Color(0xFFAAAAAA),
              ),
            ),
          ],
        ),
      ),
      children: [
        SizedBox(
          height: 275,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 130,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const GrabABitePage();
                  }));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      )),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "9:30 AM",
                        style: TextStyle(
                          fontFamily: kInter,
                          color: kNowAndComingSelectedTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: kTextRegular2X,
                        ),
                      ),
                      Text(
                        "3D",
                        style: TextStyle(
                          fontFamily: kInter,
                          color: kNowAndComingSelectedTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: kTextRegular,
                        ),
                      ),
                      Text(
                        "Screen 1",
                        style: TextStyle(
                          color: kNowAndComingSelectedTextColor,
                          fontFamily: kInter,
                          fontWeight: FontWeight.w600,
                          fontSize: kTextRegular,
                        ),
                      ),
                      Text(
                        "21 Available",
                        style: TextStyle(
                          color: kNowAndComingSelectedTextColor,
                          fontFamily: kInter,
                          fontWeight: FontWeight.w600,
                          fontSize: kTextRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_rounded,
              color: Color(0xFFAAAAAA),
            ),
            SizedBox(
              width: kMargin5,
            ),
            Text(
              kLabelInfoCinemaSelection,
              style: TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: kMargin30,
        ),
      ],
    );
  }
}
