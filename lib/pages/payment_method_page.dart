import 'package:flutter/material.dart';
import 'package:movie_booking/pages/ticket_confirmed_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

class PaymentMethodPage extends StatelessWidget {
  PaymentMethodPage({super.key});

  FocusNode nameFocus = FocusNode();

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
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),

            ///Text Filed enter name
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: nameFocus,
                      onTapOutside: (input) {
                        nameFocus.unfocus();
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              )),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          label: const Text(
                            "Your Name",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: kTextRegular,
                              fontFamily: kDmSan,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          hintText: "Enter Your Name",
                          hintStyle: const TextStyle(
                            color: Color(0xFF444444),
                            fontSize: kTextRegular,
                            fontFamily: kDmSan,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Center(
                    child: Text(
                      "*",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            ///Apply promo code button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColor,
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kPromo,
                      color: kBackgroundColor,
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Unlock Offer or Apply Promocode",
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),

            ///Choose your payment tpye
            const Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                "Choose your payment type",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: kDmSan,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PaymentListView(kImage: kUpi, kLabel: "UPI"),
            PaymentListView(kImage: kGift, kLabel: "Gift Voucher"),
            PaymentListView(kImage: kQuick, kLabel: "Quick Pay"),
            PaymentListView(kImage: kCredit, kLabel: "Credit Card/ Debit Card"),
            PaymentListView(kImage: kRedeem, kLabel: "Redeem Point"),
            PaymentListView(kImage: kMobile, kLabel: "Mobile Wallet"),
            PaymentListView(kImage: kBanking, kLabel: "Net Banking"),
          ],
        ),
      )),
    );
  }
}

class PaymentListView extends StatelessWidget {
  const PaymentListView(
      {super.key, required this.kImage, required this.kLabel});

  final String kImage;
  final String kLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kPrimaryColor,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TicketConfirmedPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border.all(
              width: 1,
              color: kNowAndComingSelectedTextColor,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.25),
                blurRadius: 4,
              ),
            ]),
        child: Row(
          children: [
            Image.asset(
              kImage,
              width: kMargin30,
              height: kMargin30,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              kLabel,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular,
                  fontFamily: kDmSan,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
