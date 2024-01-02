import 'package:flutter/material.dart';

import '../models/seat_model.dart';
import '../utils/strings.dart';
import '../utils/text_style.dart';

class CinemaSeatGridView extends StatefulWidget {
  CinemaSeatGridView({super.key, required this.onSeatSelection});

  Function(int) onSeatSelection;

  @override
  State<CinemaSeatGridView> createState() => _CinemaSeatGridViewState();
}

class _CinemaSeatGridViewState extends State<CinemaSeatGridView> {
  final List<SeatVO> allSeatList = [
    SeatVO(type: "text", text: "A"),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "seat", text: "stock", isSelected: true),
    SeatVO(type: "", text: ""),
    SeatVO(type: "", text: ""),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "seat", text: "stock"),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "seat", text: "taken"),
    SeatVO(type: "text", text: "A"),
  ];

  @override
  Widget build(BuildContext context) {
    int selectionSeat = allSeatList
        .where((element) =>
            element.type.toString().toUpperCase() == "SEAT" &&
            element.text.toString().toUpperCase() == "SELECTED")
        .length;

    return GridView.builder(
        itemCount: allSeatList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 12),
        itemBuilder: (context, index) {
          return allSeatList[index].type.toString().toUpperCase() == "TEXT"
              ? Center(
                  child: Text(
                    allSeatList[index].text,
                    style: normalTextStyle,
                  ),
                )
              : allSeatList[index].type.toString().toUpperCase() == "SEAT" &&
                      allSeatList[index].text.toUpperCase() == "TAKEN"
                  ? Image.asset(
                      kSingleSeat,
                      color: Colors.grey,
                    )
                  : allSeatList[index].type.toString().toUpperCase() ==
                              "SEAT" &&
                          allSeatList[index].text.toString().toUpperCase() ==
                              "STOCK"
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              allSeatList[index].text = "selected";
                              widget.onSeatSelection(selectionSeat);
                            });
                          },
                          child: Image.asset(
                            kSingleSeat,
                            color: allSeatList[index]
                                        .text
                                        .toString()
                                        .toUpperCase() ==
                                    "SELECTED"
                                ? Colors.green
                                : Colors.white,
                          ),
                        )
                      : allSeatList[index].type.toString().toUpperCase() ==
                                  "SEAT" &&
                              allSeatList[index]
                                      .text
                                      .toString()
                                      .toUpperCase() ==
                                  "SELECTED"
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  allSeatList[index].text = "STOCK";
                                  widget.onSeatSelection(selectionSeat);
                                });
                              },
                              child: Image.asset(
                                kSingleSeat,
                                color: Colors.green,
                              ),
                            )
                          : allSeatList[index].text.isEmpty ||
                                  allSeatList[index].text.isEmpty
                              ? Container()
                              : null;
        });
  }
}
