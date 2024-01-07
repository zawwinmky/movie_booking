import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_booking/pages/login_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';

import '../widgets_view/profile_page_widget_view.dart';

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
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              profileWidget(),
              bodyScreeListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileWidget() {
    return SizedBox(
      height: kProfilePhotoBgH,
      child: Stack(
        children: [
          Image.asset(
            kBackgroundPhoto,
            height: kProfilePhotoBgH,
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
                height: kProfilePhotoBgH,
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: kProfilePhotoBgH,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    kProfileLogoIcon,
                    width: kMargin100,
                    height: kMargin100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: kMargin20,
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
                          horizontal: kMargin40, vertical: kMargin10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kMargin8),
                          border: Border.all(
                            width: 1,
                            color: kPrimaryColor,
                          )),
                      child: const Text(
                        kLoginOrSignup,
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
    );
  }

  Widget bodyScreeListWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProfilePageWidgetListView(
            iconLabel: kLabelOne,
            kImage: kOne,
          ),
          const ProfilePageWidgetListView(
            kImage: kTwo,
            iconLabel: kLabelTwo,
          ),
          const ProfilePageWidgetListView(
            kImage: kThree,
            iconLabel: kLabelThree,
          ),
          const ProfilePageWidgetListView(
            kImage: kFour,
            iconLabel: kLabelFour,
          ),
          const ProfilePageWidgetListView(
            kImage: kFive,
            iconLabel: kLabelFive,
          ),
          const ProfilePageWidgetListView(
            kImage: kSix,
            iconLabel: kLabelSix,
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
              iconLabel: kLabelSeven,
            ),
          ),
        ],
      ),
    );
  }
}
