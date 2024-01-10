import 'package:flutter/material.dart';
import 'package:movie_booking/pages/payment_method_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/ticket_details_widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingWidget(),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: titleWidget(),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ticketWidget(),
              const SizedBox(
                height: kMargin20,
              ),
              continueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMargin22, vertical: kMargin20),
      child: TicketDetailsWidgetView(
        colorForPolicy: kColorF60,
      ),
    );
  }

  Widget leadingWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget titleWidget() {
    return const Text(
      kCheckOut,
      style: TextStyle(
        fontFamily: kDmSan,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget continueButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PaymentMethodPage();
        }));
      },
      child: SizedBox(
        width: kMargin240,
        height: kMargin50,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  kBookingButton,
                  height: kMargin50,
                  fit: BoxFit.fitHeight,
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  kBookingButton,
                  height: kMargin50,
                  fit: BoxFit.fitHeight,
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                color: kPrimaryColor,
                width: kMargin180,
                height: kMargin50,
                child: const Center(
                  child: Text(
                    kContinue,
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
    );
  }
}
