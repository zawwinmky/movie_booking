import 'package:flutter/material.dart';
import 'package:movie_booking/utils/strings.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/fonts.dart';
import '../utils/images.dart';

class TicketConfirmedWidgetView extends StatelessWidget {
  const TicketConfirmedWidgetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(98, 98, 98, 1),
              Color.fromRGBO(39, 39, 39, 0),
              Color.fromRGBO(39, 39, 39, 0.45),
              Color.fromRGBO(51, 51, 51, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  "https://images.fandango.com/ImageRenderer/500/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/21463/shawshankonesheet.jpg",
                  width: 96,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Shawshank",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: kDmSan)),
                      TextSpan(
                          text: "(3D) (U/A)",
                          style: TextStyle(
                              fontFamily: kDmSan,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white)),
                    ])),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "JCGV: Junction City",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular2X,
                          fontWeight: FontWeight.w400,
                          fontFamily: kDmSan),
                    ),
                    const SizedBox(
                      height: 17,
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
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Gold-G7,G8",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: kDmSan,
                            color: Colors.white,
                          )),
                      TextSpan(
                          text: "(SCREEN 2)",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: kDmSan,
                            color: kBottomUnselectedColor,
                          )),
                    ])),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kMargin30,
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 40),
          //   color: Colors.green,
          //   height: 30,
          //   child: const Stack(
          //     children: [
          //       Expanded(
          //           flex: 1,
          //           child: Text(
          //             "-------------------------------------------------------------------------------------------",
          //             style: TextStyle(
          //               color: kNowAndComingSelectedTextColor,
          //               fontSize: 18,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ))
          //     ],
          //   ),
          // ),
          const Divider(
            thickness: 2,
            color: kNowAndComingSelectedTextColor,
          ),

          ///to add divider here
          const SizedBox(
            height: 24,
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
                      shadows: [Shadow(color: kPrimaryColor, blurRadius: 10)],
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
                      shadows: [Shadow(color: kPrimaryColor, blurRadius: 10)],
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
                      shadows: [Shadow(color: kPrimaryColor, blurRadius: 10)],
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
            height: 40,
          ),
        ],
      ),
    );
  }
}
