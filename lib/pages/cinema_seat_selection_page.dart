import 'package:flutter/material.dart';
import 'package:movie_booking/pages/grab_a_bite_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import '../models/seat_model.dart';

class CinemaSeatSelection extends StatefulWidget {
  const CinemaSeatSelection({super.key});

  @override
  State<CinemaSeatSelection> createState() => _CinemaSeatSelectionState();
}

class _CinemaSeatSelectionState extends State<CinemaSeatSelection> {
  final List<SeatViewModel> seatList = [
    SeatViewModel(seatType: "text", value: "A"),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "A"),
    SeatViewModel(seatType: "text", value: "B"),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "B"),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "text", value: "C"),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "C"),
    SeatViewModel(seatType: "text", value: "D"),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "D"),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "text", value: "E"),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "E"),
    SeatViewModel(seatType: "text", value: "F"),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeatTaken", value: kSingleSeat),
    SeatViewModel(seatType: "text", value: "F"),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "text", value: "G"),
    SeatViewModel(seatType: "coupleSeat", value: kCoupleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "coupleSeat", value: kCoupleSeat),
    SeatViewModel(seatType: "text", value: "G"),
    SeatViewModel(seatType: "text", value: "H"),
    SeatViewModel(seatType: "coupleSeatTaken", value: kCoupleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
    SeatViewModel(seatType: "space", value: ""),
    SeatViewModel(seatType: "coupleSeatTaken", value: kCoupleSeat),
    SeatViewModel(seatType: "text", value: "H"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              height: 138,
              child: Stack(
                children: [
                  Image.asset(
                    kScreen,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "SCREEN",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kDmSan,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: Text(
                "Normal (4500 Ks)",
                style: TextStyle(
                    color: Color(0xFF888888),
                    fontWeight: FontWeight.w400,
                    fontSize: kTextRegular2X,
                    fontFamily: kDmSan),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            seatGridView(),

            ///three dots into bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              color: const Color(0xFF222222),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFF444444)),
                            color: Colors.white,
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Available",
                        style: TextStyle(
                            fontFamily: kInter,
                            fontSize: 14,
                            color: Color(0xFF888888),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFF444444)),
                            color: const Color(0xFF888888),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Taken",
                        style: TextStyle(
                            fontFamily: kInter,
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFF444444)),
                            color: kPrimaryColor,
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Your Selection",
                        style: TextStyle(
                            fontFamily: kInter,
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      size: 24,
                      color: Color(0xFF888888),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        thumbColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        value: 0.2,
                        onChanged: (input) {}),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 24,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            infoAndBuyButtonWidget(),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget seatGridView() {
    return Expanded(
      child: InteractiveViewer(
        child: GridView.builder(
            itemCount: seatList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 12),
            itemBuilder: (context, index) {
              if (seatList[index].seatType == "text") {
                return Center(
                    child: Text(
                  seatList[index].value,
                  style: const TextStyle(
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: kInter),
                ));
              } else if (seatList[index].seatType == "singleSeat") {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      seatList[index].isSelected = !seatList[index].isSelected;
                    });
                  },
                  child: Image.asset(
                    kSingleSeat,
                    color: seatList[index].isSelected ? Colors.green : null,
                  ),
                );
              } else if (seatList[index].seatType == "singleSeatTaken") {
                return Image.asset(
                  kSingleSeat,
                  color: Colors.grey,
                );
              } else if (seatList[index].seatType == "coupleSeat") {
                return GestureDetector(
                  onTap: () {
                    seatList[index].isSelected = !seatList[index].isSelected;
                    setState(() {});
                  },
                  child: Image.asset(
                    kCoupleSeat,
                    color: seatList[index].isSelected ? Colors.green : null,
                  ),
                );
              } else if (seatList[index].seatType == "coupleSeatTaken") {
                return Image.asset(
                  kCoupleSeat,
                  color: Colors.grey,
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  Widget infoAndBuyButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "2 ",
                    style: TextStyle(
                        fontFamily: kInter,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                TextSpan(
                    text: "Tickets",
                    style: TextStyle(
                        fontFamily: kInter,
                        fontSize: kTextRegular2X,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ])),
              const Text(
                "17,000 Ks",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: kInter),
              ),
            ],
          ),

          ///Buy Ticket Button

          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const GrabABitePage();
              }));
            },
            child: SizedBox(
              width: 225,
              height: 49,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      kBookingButton,
                      height: 49,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      kBookingButton,
                      height: 49,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 49,
                      width: 150,
                      color: kPrimaryColor,
                      child: const Center(
                        child: Text(
                          "Buy Ticket",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: kInter,
                            fontSize: kTextRegular2X,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
