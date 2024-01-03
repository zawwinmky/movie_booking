// import 'package:flutter/material.dart';
// import 'package:movie_booking/utils/all_enum.dart';
// import 'package:movie_booking/utils/colors.dart';
// import 'package:movie_booking/utils/strings.dart';
// import 'package:movie_booking/utils/text_style.dart';
//
// import 'models/seat_model.dart';
//
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   // State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   List<SeatModel> seatList = [
//     SeatModel(seatType: EnumSeatView.text, value: "A"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "A"),
//     SeatModel(seatType: EnumSeatView.text, value: "B"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "B"),
//     SeatModel(seatType: EnumSeatView.text, value: "C"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "C"),
//     SeatModel(seatType: EnumSeatView.text, value: "D"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "D"),
//     SeatModel(seatType: EnumSeatView.text, value: "E"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "E"),
//     SeatModel(seatType: EnumSeatView.text, value: "F"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "F"),
//     SeatModel(seatType: EnumSeatView.text, value: "G"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "G"),
//     SeatModel(seatType: EnumSeatView.text, value: "H"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "H"),
//     SeatModel(seatType: EnumSeatView.text, value: "I"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "I"),
//     SeatModel(seatType: EnumSeatView.text, value: "J"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "J"),
//     SeatModel(seatType: EnumSeatView.text, value: "K"),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(
//       seatType: EnumSeatView.seat,
//       value: kSingleSeat,
//     ),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.seat, value: kSingleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "K"),
//     SeatModel(seatType: EnumSeatView.text, value: "L"),
//     SeatModel(seatType: EnumSeatView.coupleSeat, value: kCoupleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.coupleSeat, value: kCoupleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.coupleSeat, value: kCoupleSeat),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.space, value: ''),
//     SeatModel(seatType: EnumSeatView.coupleSeat, value: kCoupleSeat),
//     SeatModel(seatType: EnumSeatView.text, value: "L"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var selectedSeatList =
//         seatList.where((element) => element.isSelected).toList();
//     int totalAmount = caculateTotalAmount(selectedSeatList: selectedSeatList);
//
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.white,
//           ),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Image.asset(
//                 kScreen,
//                 height: 138,
//                 width: double.infinity,
//               ),
//               Text(
//                 "Screen",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           Center(
//               child: Text(
//             "Normal Seats",
//             style: normalTextStyle,
//           )),
//           Expanded(
//               child: InteractiveViewer(
//             child: GridView.builder(
//                 itemCount: seatList.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisSpacing: 4,
//                     mainAxisSpacing: 12,
//                     crossAxisCount: 12),
//                 itemBuilder: (context, index) {
//                   return seatViewWidget(seatModels: seatList[index]);
//                 }),
//           )),
//           Text(
//             selectedSeatList.length.toString(),
//             style: normalTextStyle,
//           ),
//           Text(
//             " $totalAmount Ks",
//             style: normalTextStyle,
//           ),
//         ],
//       )),
//     );
//   }
//
//   Widget seatViewWidget({required SeatModel seatModels}) {
//     return seatModels.seatType == EnumSeatView.text
//         ? Center(
//             child: Text(
//               seatModels.value,
//               style: normalTextStyle,
//             ),
//           )
//         : seatModels.seatType == EnumSeatView.seat
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     seatModels.isSelected = !seatModels.isSelected;
//                   });
//                 },
//                 child: Image.asset(
//                   seatModels.value,
//                   color: seatModels.isSelected ? Colors.green : Colors.white,
//                 ),
//               )
//             : seatModels.seatType == EnumSeatView.coupleSeat
//                 ? Image.asset(seatModels.value)
//                 : Container();
//   }
//
//   int caculateTotalAmount({required List<SeatModel> selectedSeatList}) {
//     var tempAmout = 0;
//     for (var i in selectedSeatList) {
//       tempAmout += i.amount;
//     }
//     return tempAmout;
//   }
// }

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var dateMonth = DateTime.now().month;
  var dateDay = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: dateMonth == 1 ? "Jan" : "Other ",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              TextSpan(
                  text: " , $dateDay ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
            ])),
          ),
        ),
      ),
    );
  }
}
