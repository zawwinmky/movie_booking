import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

import '../utils/dimensions.dart';

class TicketDetailsWidgetView extends StatelessWidget {
  const TicketDetailsWidgetView({super.key, required this.colorForPolicy});

  final Color colorForPolicy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(98, 98, 98, 1),
              Color.fromRGBO(39, 39, 39, 0.45),
              Color.fromRGBO(51, 51, 51, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Shawshank Redemption",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: kText18,
                        fontFamily: kDmSan,
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: " (3D) (U/A)",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: kDmSan,
                        color: Colors.white,
                      )),
                ])),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "JCGV: Junction City ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: kDmSan,
                        color: kPrimaryColor,
                      )),
                  TextSpan(
                      text: "(SCREEN 2)",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: kDmSan,
                        color: Color(0xFFAAAAAA),
                      )),
                ])),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 20,
                            color: kPrimaryColor,
                            shadows: [
                              Shadow(color: kPrimaryColor, blurRadius: 10)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sat, 18 Jun, 2022 ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: kDmSan,
                              fontWeight: FontWeight.w400,
                              fontSize: kTextRegular,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: kPrimaryColor,
                            size: 20,
                            shadows: [
                              Shadow(color: kPrimaryColor, blurRadius: 10)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3:30PM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: kDmSan,
                              fontWeight: FontWeight.w400,
                              fontSize: kTextRegular,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: kPrimaryColor,
                            size: 20,
                            shadows: [
                              Shadow(color: kPrimaryColor, blurRadius: 10)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: kDmSan,
                              fontWeight: FontWeight.w400,
                              fontSize: kTextRegular,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "M-Ticket(",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: kDmSan,
                        color: kNowAndComingSelectedTextColor,
                      )),
                  TextSpan(
                      text: "2",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: kDmSan,
                        color: kPrimaryColor,
                      )),
                  TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: kDmSan,
                        color: kNowAndComingSelectedTextColor,
                      )),
                ])),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gold-G8,G7",
                      style: TextStyle(
                        fontFamily: kDmSan,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "20,000Ks",
                      style: TextStyle(
                        fontFamily: kDmSan,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                const FoodAndBeverageExpandableWidget()
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: kBackgroundColor),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: kBackgroundColor),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Convenience Fee",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: kDmSan),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      "500Ks",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: kDmSan),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                ///Cancel Policy Icon
                GestureDetector(
                  onTap: () {
                    showTicketCancellationPolicy(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorForPolicy,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ticket Cancellation Policy",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: kDmSan,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: kDmSan,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "22,500Ks",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: kDmSan,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FoodAndBeverageExpandableWidget extends StatefulWidget {
  const FoodAndBeverageExpandableWidget({
    super.key,
  });

  @override
  State<FoodAndBeverageExpandableWidget> createState() =>
      _FoodAndBeverageExpandableWidgetState();
}

class _FoodAndBeverageExpandableWidgetState
    extends State<FoodAndBeverageExpandableWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileTheme(
      data: const ExpansionTileThemeData(),
      child: ExpansionTile(
        onExpansionChanged: (input) {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        initiallyExpanded: isExpanded,
        shape: const StadiumBorder(side: BorderSide.none),
        tilePadding: EdgeInsets.zero,
        trailing: GestureDetector(
          onTap: () {},
          child: const Text(
            "2,000Ks",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: kText18,
                fontFamily: kDmSan),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              kCartIcon,
              width: kMargin20,
              height: kMargin20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Food and Beverage",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: kDmSan),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: kMargin20,
              color: Colors.white,
            ),
          ],
        ),
        children: const [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.cancel_presentation_rounded,
                size: kMargin20,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Potato Chips (Qt. 1)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular,
                  fontFamily: kDmSan,
                  color: Color(0xFF888888),
                ),
              ),
              Spacer(),
              Text(
                "1,000Ks",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular,
                  fontFamily: kDmSan,
                  color: Color(0xFF888888),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.cancel_presentation_rounded,
                size: kMargin20,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "CocaCola Large(Qt. 1)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular,
                  fontFamily: kDmSan,
                  color: Color(0xFF888888),
                ),
              ),
              Spacer(),
              Text(
                "1,000Ks",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular,
                  fontFamily: kDmSan,
                  color: Color(0xFF888888),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showTicketCancellationPolicy(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          surfaceTintColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: kPrimaryColor,
                )),
            padding:
                const EdgeInsets.symmetric(horizontal: 22, vertical: kMargin20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ticket Cancellation Policy",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: kInter,
                    fontSize: kTextRegular,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: kTextRegular2X,
                ),
                Row(
                  children: [
                    Image.asset(
                      kCartIcon,
                      width: 24,
                      color: Colors.white,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "100% Refund on F&B",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kInter,
                        fontSize: kTextRegular2X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kMargin20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kTicketIcon,
                      color: Colors.white,
                      width: 24,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Up to 75% Refund for Tickets",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: kInter,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: kMargin20,
                          ),
                          Text(
                            "-75% refund until 2 hours before show start time",
                            style: TextStyle(
                              color: kNowAndComingSelectedTextColor,
                              fontFamily: kInter,
                              fontSize: kTextRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "-50% refund between 2 hours and 20 minutes before show start time",
                            style: TextStyle(
                              color: kNowAndComingSelectedTextColor,
                              fontFamily: kInter,
                              fontSize: kTextRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: kTextRegular,
                      fontFamily: kInter),
                ),
                const SizedBox(
                  height: kMargin20,
                ),
                const Text(
                  "2.  No cancellation within 20 minute of show start time.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: kTextRegular,
                      fontFamily: kInter),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kPrimaryColor),
                    child: const Center(
                      child: Text("Close",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: kTextRegular2X,
                            fontFamily: kInter,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
