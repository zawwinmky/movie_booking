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
        title: titleWidget(),
        actions: const [
          Icon(
            Icons.star_outline_rounded,
            color: Colors.white,
            size: kMargin30,
          ),
          SizedBox(
            width: kMargin22,
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
                    height: kMargin25,
                  ),
                  cinemaName(),
                  const SizedBox(
                    height: kMargin15,
                  ),

                  ///Address
                  addressWidget(),

                  ///Spacer
                  const SizedBox(
                    height: kMargin40,
                  ),
                  facilityWidget(),
                  const SizedBox(
                    height: kTextRegular2X,
                  ),

                  ///Facilities
                  facilityAndTicketCancellation(),

                  const SizedBox(
                    height: kMargin40,
                  ),
                  safetyText(),

                  const SizedBox(
                    height: kMargin20,
                  ),
                  const Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    runSpacing: kTextSmall,
                    spacing: 2,
                    children: [
                      SafetyWidget(safetyLabel: kThermal),
                      SafetyWidget(safetyLabel: kContactless),
                      SafetyWidget(safetyLabel: kSanitization),
                      SafetyWidget(safetyLabel: kDisposable),
                      SafetyWidget(safetyLabel: kService),
                      SafetyWidget(safetyLabel: kPackage),
                      SafetyWidget(safetyLabel: kDeep),
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

  Widget safetyText() {
    return const Text(
      kSafety,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: kText18,
      ),
    );
  }

  Widget facilityWidget() {
    return const Text(
      kFacilities,
      style: TextStyle(
        fontSize: kText18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget facilityAndTicketCancellation() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              kParkingIcon,
              width: kTextRegular2X,
              height: kTextRegular2X,
              color: kPrimaryColor,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              kParking,
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
              width: kTextRegular2X,
              height: kTextRegular2X,
              color: kPrimaryColor,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              kFoodLabel,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: kMargin15,
            ),
            Image.asset(
              kWheelChair,
              width: kTextRegular2X,
              height: kTextRegular2X,
              color: kPrimaryColor,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
            ),
            const Text(
              kWheelChairLabel,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(
          height: kTextSmall,
        ),

        ///ticket cancellation
        Row(
          children: [
            Image.asset(
              kCancelTicket,
              width: kTextRegular,
              height: kTextRegular,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin5,
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
      ],
    );
  }

  Widget addressWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Text(
            "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: kText18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: kMargin70,
        ),
        Image.asset(
          kArrow,
          color: kPrimaryColor,
          width: kMargin50,
          height: kMargin50,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget cinemaName() {
    return const Text(
      "JCGV : Junction City",
      style: TextStyle(
        fontSize: kTextRegular2X,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget titleWidget() {
    return const Text(
      kCinemaDetails,
      style: TextStyle(
        fontFamily: kDmSan,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: kMargin22,
      ),
    );
  }
}

class SafetyWidget extends StatelessWidget {
  const SafetyWidget({super.key, required this.safetyLabel});

  final String safetyLabel;

  @override
  Widget build(BuildContext context) {
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
