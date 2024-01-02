import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:pinput/pinput.dart';

import '../pages/main_page.dart';

class OTPCodePinPutView extends StatefulWidget {
  const OTPCodePinPutView({Key? key}) : super(key: key);

  @override
  State<OTPCodePinPutView> createState() => _OTPCodePinPutViewState();
}

class _OTPCodePinPutViewState extends State<OTPCodePinPutView> {
  final dummyCode = "111111";
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool isValid = false;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.green;
    const borderColor = Colors.grey;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Enter OTP Code",
          style: TextStyle(
            color: kNowAndComingSelectedTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: kDmSan,
            fontSize: kTextRegular,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Pinput(
          length: 6,
          onChanged: (input) {
            if (input.length > 5) {
              if (input == dummyCode) {
                isValid = true;
              } else {
                isValid = false;
              }
            }
            setState(() {});
          },
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => const SizedBox(width: 8),
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          useNativeKeyboard: true,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 2, color: focusedBorderColor),
            ),
          ),
          followingPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
            color: Colors.grey,
          )),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't receive OTP?",
              style: TextStyle(
                fontSize: kTextRegular,
                fontFamily: kInter,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    fontSize: kTextRegular2X,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
            onTap: !isValid
                ? null
                : () {
                    focusNode.unfocus();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const MainPage();
                    }));
                  },
            child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: isValid ? kPrimaryColor : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: const Text(
                  "Confirm OTP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )))),
      ],
    );
  }
}
