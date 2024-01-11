import 'package:flutter/material.dart';
import 'package:movie_booking/pages/ticket_confirmed_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

class PaymentMethodPage extends StatelessWidget {
  PaymentMethodPage({super.key});

  final FocusNode nameFocus = FocusNode();

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
          kPaymentTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: kText18,
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: kMargin30,
            ),

            ///Text Filed enter name
            nameInputFieldView(),

            const SizedBox(
              height: kMargin30,
            ),

            ///Apply promo code button
            applyPromoCodeButton(),

            //Spacer
            const SizedBox(
              height: kMargin35,
            ),

            ///Choose your payment type
            chooseYourPaymentTypeText(),
            const SizedBox(
              height: kMargin20,
            ),
            const PaymentListView(kImage: kUpi, kLabel: kUpiLabel),
            const PaymentListView(kImage: kGift, kLabel: kGiftLabel),
            const PaymentListView(kImage: kQuick, kLabel: kQuickLabel),
            const PaymentListView(kImage: kCredit, kLabel: kCreditLabel),
            const PaymentListView(kImage: kRedeem, kLabel: kRedeemLabel),
            const PaymentListView(kImage: kMobile, kLabel: kMobileLabel),
            const PaymentListView(kImage: kBanking, kLabel: kNetLabel),
          ],
        ),
      )),
    );
  }

  Widget nameInputFieldView() {
    return Padding(
      padding: const EdgeInsets.only(left: kMargin40, right: kMargin30),
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
              style: const TextStyle(
                fontSize: kTextRegular,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kMargin8),
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
                    borderRadius: BorderRadius.circular(kMargin8),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  label: const Text(
                    kYourName,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: kTextRegular,
                      fontFamily: kDmSan,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  hintText: kEnterYourName,
                  hintStyle: const TextStyle(
                    color: kNowAndComingSelectedTextColor,
                    fontSize: kTextRegular,
                    fontFamily: kDmSan,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
          const SizedBox(
            width: kMargin10,
          ),
          const Center(
            child: Text(
              "*",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular2X),
            ),
          )
        ],
      ),
    );
  }

  Widget chooseYourPaymentTypeText() {
    return const Padding(
      padding: EdgeInsets.only(left: kMargin22),
      child: Text(
        kChoosePaymentLabel,
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w700,
          fontFamily: kDmSan,
          fontSize: kText18,
        ),
      ),
    );
  }

  Widget applyPromoCodeButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kMargin40),
      height: kMargin40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMargin8),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              kPromo,
              color: kBackgroundColor,
              height: kMargin25,
              width: kMargin25,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kMargin10,
            ),
            const Text(
              kUnlockOffer,
              style: TextStyle(
                color: kBackgroundColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const TicketConfirmedPage();
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kMargin10, vertical: kMargin10),
        margin: const EdgeInsets.symmetric(
            vertical: kMargin8, horizontal: kMargin20),
        height: kMargin50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border.all(
              width: 1,
              color: kNowAndComingSelectedTextColor,
            ),
            borderRadius: BorderRadius.circular(kMargin8),
            boxShadow: const [
              BoxShadow(
                color: kColor255,
                blurRadius: kMargin4,
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
              width: kMargin10,
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
              size: kMargin20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
