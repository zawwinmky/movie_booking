import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/cast_item_view.dart';
import 'package:movie_booking/pages/cinema_selection_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

import '../widgets_view/back_button_and_share_button_widget.dart';
import '../widgets_view/censor_rating_release_date_and_duration_widget.dart';
import '../widgets_view/movie_large_image_small_image_and_info_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          const SingleChildScrollView(
            child: Column(
              children: [
                ///movie image and info
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

                ///Story Line
                StoryLine(),

                SizedBox(
                  height: kMargin30,
                ),

                CastView(),

                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),

          ///App Bar
          const BackButtonAndShareButtonWidget(),

          ///Bottom Gradient And Booking Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: kMovieDetailsBottomContainerHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  kBackgroundColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const CinemaSelectionPage();
                        }));
                      },
                      child: const BookingButton())),
            ),
          ),
        ],
      )),
    );
  }
}

class StoryLine extends StatelessWidget {
  const StoryLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Story Line",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kTextRegular,
            ),
          ),
          SizedBox(
            height: kMarginMedium,
          ),
          Text(
            "Andy Dufresne (Tim Robbins) is sentenced to two consecutive life terms in prison for the murders of his wife and her lover and is sentenced to a tough prison. However, only Andy knows he didn't commit the crimes. While there, he forms a friendship with Red (Morgan Freeman), experiences brutality of prison life, adapts, helps the warden, etc., all in 19 years.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kTextSmall,
            ),
          )
        ],
      ),
    );
  }
}

class CastView extends StatelessWidget {
  const CastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Cast Label
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
          child: Text(
            "Cast",
            style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular,
                fontWeight: FontWeight.w700),
          ),
        ),

        ///
        const SizedBox(
          height: kMarginMedium3,
        ),

        ///Cast item list
        SizedBox(
          height: kMargin60,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CastItemView();
              }),
        ),

        const SizedBox(
          height: kMargin60,
        ),
      ],
    );
  }
}

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      height: kMovieDetailsBookingButtonHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              kBookingButton,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(kBookingButton),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(kMarginMedium2),
              ),
              child: const Center(
                child: Text(
                  kMovieBookingButtonLabel,
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular2X,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
