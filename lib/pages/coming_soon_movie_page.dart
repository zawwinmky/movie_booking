import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/back_button_and_share_button_widget.dart';
import 'package:movie_booking/widgets_view/movie_large_image_small_image_and_info_widget.dart';

import '../widgets_view/censor_rating_release_date_and_duration_widget.dart';
import 'movie_details_page.dart';

class ComingSoonMoviePage extends StatelessWidget {
  const ComingSoonMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                MovieLarImageSmallImageAndInfo(),
                SizedBox(
                  height: kMargin30,
                ),

                ///Censor , Rating, Release date and duration
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                  child: CensorRatingReleaseDateAndDuration(),
                ),

                SizedBox(
                  height: kMargin30,
                ),

                ///Releasing in coming Day and set notification button
                ReleasingInComingDaysAndSetNotiButton(),
                SizedBox(
                  height: kMargin30,
                ),

                ///Story Line
                StoryLine(),

                SizedBox(
                  height: kMargin30,
                ),

                CastView(),
              ],
            ),
          ),
          BackButtonAndShareButtonWidget(),
        ],
      ),
    ));
  }
}

class ReleasingInComingDaysAndSetNotiButton extends StatelessWidget {
  const ReleasingInComingDaysAndSetNotiButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
      padding: const EdgeInsets.only(
          top: kMarginCardMedium2,
          bottom: kMarginCardMedium2,
          left: kMarginCardMedium2,
          right: kMargin5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTextSmall),
        gradient: const LinearGradient(
          colors: [
            kComingDayBackgroundColorThree,
            kComingDayBackgroundColorTwo,
            kComingDayBackgroundColorOne,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///Text and noti button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Releasing in 5 Days",
                  style: TextStyle(
                    fontSize: kTextRegular2X,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: kTextSmall,
                ),
                const Text(
                  kGetNotifyButtonLabel,
                  style: TextStyle(
                    fontSize: kTextRegular,
                    fontWeight: FontWeight.w600,
                    color: kGetNotiTextColor,
                  ),
                ),
                const SizedBox(
                  height: kMarginMedium3,
                ),
                InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    ///DO Something
                  },
                  child: Container(
                    padding: const EdgeInsets.all(kMarginMedium),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(kMarginMedium),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.notifications_active,
                          size: kTextRegular2X,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: kTextSmall,
                        ),
                        Text(
                          kSetNotiLabel,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: kTextRegular,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///Girl Image
          Image.asset(
            kNotiGirl,
            height: kNotiGirlHeight,
            width: kNotiGirlWidth,
          ),
        ],
      ),
    );
  }
}
