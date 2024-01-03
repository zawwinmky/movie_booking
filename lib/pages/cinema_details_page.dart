import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

class CinemaDetailsPage extends StatelessWidget {
  const CinemaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Cinemas Details",
          style: TextStyle(
            fontFamily: kDmSan,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          const Icon(
            Icons.star_outline_rounded,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 22,
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              kCinemas,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMargin22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 26,
                  ),
                  const Text(
                    "JCGV : Junction City",
                    style: TextStyle(
                      fontSize: kTextRegular2X,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ///Address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Text(
                          "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 71,
                      ),
                      Image.asset(
                        kArrow,
                        color: kPrimaryColor,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),

                  ///Spacer
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  ///Facilities
                  Row(
                    children: [
                      Image.asset(
                        kParkingIcon,
                        width: 16,
                        height: 16,
                        color: kPrimaryColor,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Parking",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        kCartIcon,
                        width: 16,
                        height: 16,
                        color: kPrimaryColor,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Food",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        kWheelChair,
                        width: 16,
                        height: 16,
                        color: kPrimaryColor,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Wheel Chair",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  ///ticket cancellation
                  Row(
                    children: [
                      Image.asset(
                        kCancelTicket,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Ticket Cancellation",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Safety",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    runSpacing: 12,
                    spacing: 2,
                    children: [
                      SafetyWidget(safetyLabel: "Thermanal Scannig"),
                      SafetyWidget(safetyLabel: "Contactless Security Check"),
                      SafetyWidget(
                          safetyLabel: "Santization Before Every Show"),
                      SafetyWidget(safetyLabel: "Disposable 3D glass"),
                      SafetyWidget(safetyLabel: "Contactless Food Serviec"),
                      SafetyWidget(safetyLabel: "Package Food "),
                      SafetyWidget(safetyLabel: "Deep Cleaning of rest room"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class SafetyWidget extends StatelessWidget {
  const SafetyWidget({super.key, required this.safetyLabel});

  final String safetyLabel;

  @override
  Widget build(BuildContext) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        safetyLabel,
        style: const TextStyle(
          fontSize: kTextRegular,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
