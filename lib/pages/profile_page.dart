import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_booking/pages/login_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Image.asset(
                    kBackgroundPhoto,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            kProfileLogoIcon,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }), (route) => false);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                    color: kPrimaryColor,
                                  )),
                              child: const Text(
                                "Login or Sing Up",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kInter,
                                  fontSize: kTextRegular2X,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProfilePageWidgetListView(
                    iconLabel: 'Purchase History',
                    kImage: kOne,
                  ),
                  const ProfilePageWidgetListView(
                    kImage: kTwo,
                    iconLabel: 'Offer',
                  ),
                  const ProfilePageWidgetListView(
                    kImage: kThree,
                    iconLabel: 'Gift Card',
                  ),
                  const ProfilePageWidgetListView(
                    kImage: kFour,
                    iconLabel: 'Location',
                  ),
                  const ProfilePageWidgetListView(
                    kImage: kFive,
                    iconLabel: 'Payment',
                  ),
                  const ProfilePageWidgetListView(
                    kImage: kSix,
                    iconLabel: 'Help and Support',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }), (route) => false);
                    },
                    child: const ProfilePageWidgetListView(
                      kImage: kSeven,
                      isBorder: false,
                      iconLabel: 'Logout',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePageWidgetListView extends StatelessWidget {
  const ProfilePageWidgetListView(
      {super.key,
      required this.iconLabel,
      required this.kImage,
      this.isBorder = true});

  final String iconLabel;
  final bool isBorder;
  final String kImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isBorder
            ? const Border(
                bottom: BorderSide(
                width: 0.5,
                color: Colors.grey,
              ))
            : const Border(
                bottom: BorderSide.none,
              ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 22),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            kImage,
            width: 30,
            height: 30,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            iconLabel,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kTextRegular2X,
              fontFamily: kInter,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30,
            color: Color(0xFF444444),
          ),
        ],
      ),
    );
  }
}
