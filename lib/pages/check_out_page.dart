import 'package:flutter/material.dart';
import 'package:movie_booking/pages/payment_method_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/ticket_details_widget.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Check Out",
          style: TextStyle(
            fontFamily: kDmSan,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
                child: TicketDetailsWidgetView(
                  colorForPolicy: Color(0xFFFF6B00),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PaymentMethodPage();
                  }));
                },
                child: SizedBox(
                  width: 240,
                  height: 49,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            kBookingButton,
                            height: 49,
                            fit: BoxFit.fitHeight,
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            kBookingButton,
                            height: 49,
                            fit: BoxFit.fitHeight,
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: kPrimaryColor,
                          width: 180,
                          height: 49,
                          child: const Center(
                            child: Text(
                              "Continue",
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
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
