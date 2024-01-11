import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/ticket_details_widget.dart';

class TicketCancelPage extends StatelessWidget {
  const TicketCancelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: kMargin22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: titleText(),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMargin22, vertical: kMargin20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TicketDetailsWidgetView(
                  colorForPolicy: kColorF20,
                ),
                const SizedBox(
                  height: kMargin30,
                ),
                refundAndCancelButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget refundAndCancelButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kRefund,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: kTextRegular2X,
                fontFamily: kInter,
              ),
            ),
            Text(
              "15,000Ks",
              style: TextStyle(
                color: kColorF20,
                fontWeight: FontWeight.w700,
                fontSize: kMargin20,
                fontFamily: kInter,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kMargin50,
          width: 230,
          child: Stack(
            children: [
              Align(
                child: Image.asset(
                  kCancel,
                  width: 225,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 170,
                  height: kMargin50,
                  color: kColorF20,
                  child: const Center(
                      child: Text(
                    kCancelBooking,
                    style: TextStyle(
                      fontFamily: kInter,
                      fontSize: kTextRegular2X,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget titleText() {
    return const Text(
      kTicketDetails,
      style: TextStyle(
        color: Colors.white,
        fontFamily: kDmSan,
        fontSize: kMargin22,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
