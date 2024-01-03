import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: kMargin22, right: kMargin22, top: kMargin30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  kLoginLogo,
                  width: 124,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  kVerifyPhoneLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: kInter,
                    fontSize: kMargin22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
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
                ),
                const SizedBox(
                  height: 80,
                ),

                Column(
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
                        const Expanded(
                            child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular2X,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
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
                ),

                const SizedBox(
                  height: kMargin50,
                ),

                ///Verify Phone Number Button
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const VerifySmsCode();
                    }));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kPrimaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        "Verify Your Phone Number",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: kTextRegular,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: kMargin22),
                  child: Center(
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: kTextRegular2X,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

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
                  height: 94,
                ),
                const Text(
                  kTermsAndConditions,
                  style: TextStyle(
                      fontFamily: kDmSan,
                      fontWeight: FontWeight.w400,
                      fontSize: kTextSmall,
                      color: kNowAndComingSelectedTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
