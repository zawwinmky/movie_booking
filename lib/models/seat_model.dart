// import 'package:movie_booking/utils/all_enum.dart';
//
// class SeatModel {
//   EnumSeatView seatType = EnumSeatView.seat;
//   String value = "";
//   bool isSelected = false;
//   int amount = 0;
//
//   SeatModel(
//       {required this.seatType,
//       required this.value,
//       this.isSelected = false,
//       this.amount = 3500});
// }

class SeatVO {
  String type = "";
  String text = "";
  bool isSelected = false;

  SeatVO({required this.type, required this.text, this.isSelected = false});
}
