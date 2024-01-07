import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/otp_code_pinput_view_widget.dart';

class VerifySmsCodePage extends StatefulWidget {
  const VerifySmsCodePage({super.key});

  @override
  State<VerifySmsCodePage> createState() => _VerifySmsCodePageState();
}

class _VerifySmsCodePageState extends State<VerifySmsCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMargin22),
          child: Column(
            children: [
              backButtonWidget(),
              Image.asset(
                kLoginLogo,
                width: kLogoWidth,
                fit: BoxFit.fitWidth,
              ),

              ///Spacer
              const SizedBox(
                height: kMargin80,
              ),

              sentOtpText(),

              const SizedBox(
                height: kMargin10,
              ),
              sentOtpCodeLongText(),
              const SizedBox(height: kMargin60),
              const OTPCodePinPutView(),
              const SizedBox(
                height: kMargin150,
              ),
              termsAndConditions(),
            ],
          ),
        ),
      )),
    );
  }

  Widget backButtonWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget sentOtpText() {
    return const Text(
      kSentOtpCode,
      style: TextStyle(
        color: Colors.white,
        fontSize: kText22,
        fontFamily: kDmSan,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget sentOtpCodeLongText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMargin80),
      child: Text(
        kSentOTPCodeText,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: kDmSan,
            fontWeight: FontWeight.w400,
            fontSize: kTextRegular,
            color: kNowAndComingSelectedTextColor),
      ),
    );
  }

  Widget termsAndConditions() {
    return const Text(
      kTermsAndConditions,
      style: TextStyle(
          fontFamily: kDmSan,
          fontWeight: FontWeight.w400,
          fontSize: kTextSmall,
          color: kNowAndComingSelectedTextColor),
    );
  }
}
