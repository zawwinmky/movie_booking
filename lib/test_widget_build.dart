import 'package:flutter/material.dart';

enum EnumViewType { seat, text, space }

class PADCTestPage extends StatefulWidget {
  const PADCTestPage({super.key});

  @override
  State<PADCTestPage> createState() => _PADCTestPageState();
}

class _PADCTestPageState extends State<PADCTestPage> {
  List<SeatViewModel> dynamicList = [
    SeatViewModel(seatType: EnumViewType.text, value: "A"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.text, value: "A"),
    SeatViewModel(seatType: EnumViewType.text, value: "B"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.text, value: "B"),
    SeatViewModel(seatType: EnumViewType.text, value: "C"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.text, value: "C"),
    SeatViewModel(seatType: EnumViewType.text, value: "D"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.text, value: "D"),
    SeatViewModel(seatType: EnumViewType.text, value: "E"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(seatType: EnumViewType.space, value: ""),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(
        seatType: EnumViewType.seat, value: "assets/icons/faryAppLogo.png"),
    SeatViewModel(seatType: EnumViewType.text, value: "E"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: dynamicList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 12),
          itemBuilder: (context, index) {
            return seatView(
              dynamicSeat: dynamicList[index],
            );
          }),
    );
  }
}

Widget seatView({required SeatViewModel dynamicSeat}) {
  return dynamicSeat.seatType == EnumViewType.seat
      ? Image.asset(dynamicSeat.value)
      : dynamicSeat.seatType == EnumViewType.space
          ? Container()
          : Center(child: Text(dynamicSeat.value));
}

class SeatViewModel {
  EnumViewType seatType = EnumViewType.text;
  String value = "";

  SeatViewModel({required this.seatType, required this.value});
}
