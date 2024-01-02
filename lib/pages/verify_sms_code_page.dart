import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/otp_code_pinput_view_widget.dart';

class VerifySmsCode extends StatefulWidget {
  const VerifySmsCode({super.key});

  @override
  State<VerifySmsCode> createState() => _VerifySmsCodeState();
}

class _VerifySmsCodeState extends State<VerifySmsCode> {
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
              Align(
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
              ),
              Image.asset(
                kLoginLogo,
                width: 124,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "We've sent OTP Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: kDmSan,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  kSentOTPCodeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: kDmSan,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: kNowAndComingSelectedTextColor),
                ),
              ),
              const SizedBox(height: 60),
              const OTPCodePinPutView(),
              const SizedBox(
                height: 150,
              ),
              const Text(
                kTermsAndConditions,
                style: TextStyle(
                    fontFamily: kDmSan,
                    fontWeight: FontWeight.w400,
                    fontSize: kTextSmall,
                    color: kNowAndComingSelectedTextColor),
              )
            ],
          ),
        ),
      )),
    );
  }
}
