import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_booking/pages/verify_sms_code_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/show_country_codes_drop_down_button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kMargin22, vertical: kMargin30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Top Logo Image
                Image.asset(
                  kLoginLogo,
                  width: kEnterPhoneNoLogoW,
                  height: kEnterPhoneNoLogoH,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: kMargin80,
                ),
                verifyPhoneNumberText(),

                ///Spacer
                const SizedBox(
                  height: kMargin10,
                ),

                ///We will send 6 digit text,
                smsCodeText(),

                ///Spacer
                const SizedBox(
                  height: kMargin80,
                ),

                ///Phone Number Input Field
                phoneNumberInputView(),

                ///Spacer
                const SizedBox(
                  height: kMargin50,
                ),

                verifyPhoneButtonView(),

                orDividerView(),

                ///Google Button
                InkWell(
                  onTap: () {
                    ///Later
                  },
                  child: Container(
                    width: double.infinity,
                    height: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            kGoogleLogo,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            kGoogleButtonLabel,
                            style: TextStyle(
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: kMargin100,
                ),
                termsAndConditionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget termsAndConditionsWidget() {
    return const Text(
      kTermsAndConditions,
      style: TextStyle(
          fontFamily: kDmSan,
          fontWeight: FontWeight.w400,
          fontSize: kTextSmall,
          color: kNowAndComingSelectedTextColor),
    );
  }

  Widget verifyPhoneNumberText() {
    return const Text(
      kVerifyPhoneLabel,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: kInter,
        fontSize: kMargin22,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget smsCodeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMargin100),
      child: Text(
        kCodeSmsLabel,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: kDmSan,
          fontWeight: FontWeight.w400,
          fontSize: kTextSmall,
          color: kNowAndComingSelectedTextColor,
        ),
      ),
    );
  }

  Widget phoneNumberInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Country Code",
          style: TextStyle(
            color: kNowAndComingSelectedTextColor,
            fontSize: kTextSmall,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ))),
                child: const ShowCountryCodeDropdownWidget()),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextField(
              controller: phoneTEC,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: kTextRegular2X,
                fontWeight: FontWeight.w700,
              ),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.only(left: ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: kPrimaryColor,
                )),
                focusColor: kPrimaryColor,
                hintText: "Mobile Number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: kNowAndComingSelectedTextColor,
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget verifyPhoneButtonView() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const VerifySmsCodePage();
        }));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: kMargin15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMargin8),
          color: kPrimaryColor,
        ),
        child: const Center(
          child: Text(
            kVerifyPhoneLabel,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: kInter,
              fontSize: kTextRegular2X,
            ),
          ),
        ),
      ),
    );
  }

  Widget orDividerView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: kColor444,
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: kMargin20, vertical: kMargin25),
          child: Text(
            kOrLabel,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: kTextRegular2X,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kColor444,
          ),
        ),
      ],
    );
  }
}
