import 'package:flutter/material.dart';
import 'package:movie_booking/pages/choose_region_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:pinput/pinput.dart';
import '../pages/main_page.dart';
import '../utils/strings.dart';

class OTPCodePinPutView extends StatefulWidget {
  const OTPCodePinPutView({Key? key}) : super(key: key);

  @override
  State<OTPCodePinPutView> createState() => _OTPCodePinPutViewState();
}

class _OTPCodePinPutViewState extends State<OTPCodePinPutView> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = kPrimaryColor;
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: kMargin50,
      height: kMargin50,
      textStyle: const TextStyle(
        fontSize: kTextRegular,
        fontFamily: kDmSan,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              kEnterOtpCode,
              style: TextStyle(
                color: kNowAndComingSelectedTextColor,
                fontWeight: FontWeight.w400,
                fontFamily: kDmSan,
                fontSize: kTextRegular,
              ),
            ),
            const SizedBox(
              height: kMargin5,
            ),
            Pinput(
              length: 6,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: kMargin8),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: kMargin8),
                    width: kMargin22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              useNativeKeyboard: true,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kMargin4),
                  border: Border.all(width: 2, color: focusedBorderColor),
                ),
              ),
              followingPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                color: Colors.white,
              )),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kMargin4),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.red),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: kMargin40,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              kDontReceiveOTP,
              style: TextStyle(
                fontSize: kTextRegular,
                fontFamily: kInter,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  kResendCode,
                  style: TextStyle(
                    fontSize: kTextRegular2X,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: kMargin40,
        ),
        InkWell(
            onTap: () {
              focusNode.unfocus();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const ChooseRegionPage();
              }));
            },
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: kMargin10),
                height: kMargin50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kMargin8),
                ),
                child: const Center(
                    child: Text(
                  kConfirmOTP,
                  style: TextStyle(
                    fontSize: kTextRegular2X,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )))),
      ],
    );
  }
}
