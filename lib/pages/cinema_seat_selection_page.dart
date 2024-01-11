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
  double _scale = 1.0;
  late TransformationController _seatGridViewZoomController;

  @override
  void initState() {
    _seatGridViewZoomController = TransformationController();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _seatGridViewZoomController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SeatViewModel> selectedList =
        seatList.where((element) => element.isSelected).toList();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(),
            screenWidget(),
            normalTextWidget(),

            const SizedBox(
              height: kMargin30,
            ),
            seatGridView(),

            ///three dots seat info bar available,taken,selection
            seatConditionBar(),
            const SizedBox(
              height: kMargin20,
            ),

            ///Slider
            zoomSlider(),
            const SizedBox(
              height: kMargin45,
            ),
            InfoAndBuyTicket(
              totalSelectedSeats: selectedList.length.toString(),
            ),
            const SizedBox(
              height: kMargin30,
            ),
          ],
        ),
      ),
    );
  }

  Widget seatConditionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kMargin24, vertical: kMargin10),
      color: kColor222,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: kMargin10,
                width: kMargin10,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kColor444),
                    color: Colors.white,
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin10,
              ),
              const Text(
                "Available",
                style: TextStyle(
                    fontFamily: kInter,
                    fontSize: kTextRegular,
                    color: kBottomUnselectedColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: kMargin10,
                width: kMargin10,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kColor444),
                    color: kBottomUnselectedColor,
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin10,
              ),
              const Text(
                "Taken",
                style: TextStyle(
                    fontFamily: kInter,
                    color: kBottomUnselectedColor,
                    fontSize: kTextRegular,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: kMargin10,
                width: kMargin10,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kColor444),
                    color: kPrimaryColor,
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin10,
              ),
              const Text(
                "Your Selection",
                style: TextStyle(
                    fontFamily: kInter,
                    color: kBottomUnselectedColor,
                    fontSize: kTextRegular,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget normalTextWidget() {
    return const Center(
      child: Text(
        kNormalText,
        style: TextStyle(
            color: kNowAndComingSelectedTextColor,
            fontWeight: FontWeight.w400,
            fontSize: kTextRegular2X,
            fontFamily: kDmSan),
      ),
    );
  }

  Widget backButton() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.only(left: kMargin22),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ));
  }

  Widget screenWidget() {
    return SizedBox(
      height: kMargin140,
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
                fontSize: kTextRegular2X,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget seatGridView() {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            _scale = 1;
            _seatGridViewZoomController.value = Matrix4.identity()
              ..scale(_scale);
          });
        },
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(kMargin100),
          scaleEnabled: true,
          scaleFactor: 10,
          minScale: 1,
          maxScale: 4,
          // panAxis: PanAxis.free,
          onInteractionUpdate: (input) {
            debugPrint(input.scale.toString());
            if (input.scale >= 1 && input.scale <= 4) {
              setState(() {
                _scale = input.scale;
              });
            } else {}
          },
          transformationController: _seatGridViewZoomController,
          child: GridView.builder(
              itemCount: seatList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: kMargin10,
                  mainAxisSpacing: kMargin10,
                  crossAxisCount: 12),
              itemBuilder: (context, index) {
                if (seatList[index].seatType == "text") {
                  return Center(
                      child: Text(
                    seatList[index].value,
                    style: const TextStyle(
                        color: kColor444,
                        fontWeight: FontWeight.w500,
                        fontSize: kTextSmall,
                        fontFamily: kInter),
                  ));
                } else if (seatList[index].seatType == "singleSeat") {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        seatList[index].isSelected =
                            !seatList[index].isSelected;
                      });
                    },
                    child: Image.asset(
                      kSingleSeat,
                      color: seatList[index].isSelected ? kPrimaryColor : null,
                    ),
                  );
                } else if (seatList[index].seatType == "singleSeatTaken") {
                  return Image.asset(
                    kSingleSeat,
                    color: Colors.grey,
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }

  Widget zoomSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin40),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (_scale >= 1) {
                _scale -= 0.6;
                if (_scale < 1) {
                  setState(() {
                    _scale = 1;
                    _seatGridViewZoomController.value = Matrix4.identity()
                      ..scale(_scale);
                  });
                } else {
                  setState(() {
                    _seatGridViewZoomController.value = Matrix4.identity()
                      ..scale(_scale);
                  });
                }
              }
            },
            icon: const Icon(
              Icons.remove,
              size: kMargin24,
              color: kBottomUnselectedColor,
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: Colors.white,
                thumbColor: Colors.white,
                trackHeight: 2,
                overlayColor: Colors.transparent,
              ),
              child: Slider(
                value: _scale,
                min: 1,
                max: 4,
                onChanged: (value) {
                  setState(() {
                    _scale = value;
                    _seatGridViewZoomController.value = Matrix4.identity()
                      ..scale(_scale);
                  });
                },
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (_scale < 4) {
                _scale += 0.6;
                debugPrint(_scale.toString());
                if (_scale > 4) {
                  _scale = 4;
                  setState(() {
                    _seatGridViewZoomController.value = Matrix4.identity()
                      ..scale(_scale);
                  });
                } else {
                  setState(() {
                    _seatGridViewZoomController.value = Matrix4.identity()
                      ..scale(_scale);
                  });
                }
              }
            },
            icon: const Icon(
              Icons.add,
              size: kMargin24,
              color: kBottomUnselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoAndBuyTicket extends StatelessWidget {
  const InfoAndBuyTicket({super.key, required this.totalSelectedSeats});
  final String totalSelectedSeats;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "$totalSelectedSeats ",
                    style: const TextStyle(
                        fontFamily: kInter,
                        fontSize: kText18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                TextSpan(
                    text: int.parse(totalSelectedSeats) > 1
                        ? kTicketsLabel
                        : kTicketLabel,
                    style: const TextStyle(
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
                    fontSize: kTextRegular3X,
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
              width: kMargin225,
              height: kMargin50,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      kBookingButton,
                      height: kMargin50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      kBookingButton,
                      height: kMargin50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: kMargin50,
                      width: kMargin150,
                      color: kPrimaryColor,
                      child: const Center(
                        child: Text(
                          kBuyTicket,
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
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "space", value: ""),
  SeatViewModel(seatType: "space", value: ""),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "text", value: "G"),
  SeatViewModel(seatType: "text", value: "H"),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "space", value: ""),
  SeatViewModel(seatType: "space", value: ""),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "singleSeat", value: kSingleSeat),
  SeatViewModel(seatType: "text", value: "H"),
];
