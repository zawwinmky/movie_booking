import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_booking/pages/main_page.dart';
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
                      fontWeight: FontWeight.w400,
                      fontSize: kTextSmall,
                      color: kNowAndComingSelectedTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),

                Container(
                  child: Column(
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
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
                ),

                const SizedBox(
                  height: kMargin50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const MainPage();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class show extends StatefulWidget {
  const show({super.key});

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
