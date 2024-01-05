import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
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
            size: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Ticket Details",
          style: TextStyle(
            color: Colors.white,
            fontFamily: kDmSan,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TicketDetailsWidgetView(
                  colorForPolicy: Color(0xFFFF2E00),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refund Amount",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: kInter,
                          ),
                        ),
                        Text(
                          "15,000Ks",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: kInter,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 49,
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
                              height: 49,
                              color: const Color(0xFFFF2E00),
                              child: const Center(
                                  child: Text(
                                "Cancel Booking",
                                style: TextStyle(
                                  fontFamily: kInter,
                                  fontSize: 16,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
