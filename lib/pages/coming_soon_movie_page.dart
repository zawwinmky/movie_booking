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
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const MovieLarImageSmallImageAndInfo(),
                const SizedBox(
                  height: kMargin30,
                ),

                ///Censor , Rating, Release date and duration
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                  child: CensorRatingReleaseDateAndDuration(),
                ),

                const SizedBox(
                  height: kMargin30,
                ),

                ///Releasing in coming Day and set notification button
                releasingInComingDayWidget(),
                const SizedBox(
                  height: kMargin30,
                ),

                ///Story Line
                const StoryLine(),

                const SizedBox(
                  height: kMargin30,
                ),

                const CastView(),
              ],
            ),
          ),
          const BackButtonAndShareButtonWidget(),
        ],
      ),
    ));
  }

  Widget releasingInComingDayWidget() {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kReleaseDays,
                style: TextStyle(
                  fontSize: kTextRegular2X,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: kTextSmall,
              ),
              Text(
                kGetNotifyButtonLabel,
                style: TextStyle(
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w600,
                  color: kGetNotiTextColor,
                ),
              ),
              SizedBox(
                height: kMarginMedium3,
              ),
              SetNotiButton(),
            ],
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

class SetNotiButton extends StatefulWidget {
  const SetNotiButton({
    super.key,
  });

  @override
  State<SetNotiButton> createState() => _SetNotiButtonState();
}

class _SetNotiButtonState extends State<SetNotiButton> {
  bool isSetNotified = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSetNotified = !isSetNotified;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.notifications_active,
              size: kTextRegular2X,
              color: Colors.black,
            ),
            const SizedBox(
              width: kTextSmall,
            ),
            Text(
              isSetNotified ? kSetNotiLabel : kUndo,
              style: const TextStyle(
                color: Colors.black,
                fontSize: kTextRegular,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
