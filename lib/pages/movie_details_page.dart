import 'package:flutter/material.dart';
import 'package:movie_booking/data/models/movie_booking_model.dart';
import 'package:movie_booking/list_items/cast_item_view.dart';
import 'package:movie_booking/pages/cinema_selection_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

import '../data/VOs/credit_vo.dart';
import '../data/VOs/movie_vo.dart';
import '../widgets_view/back_button_and_share_button_widget.dart';
import '../widgets_view/censor_rating_release_date_and_duration_widget.dart';
import '../widgets_view/movie_large_image_small_image_and_info_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieID;
  const MovieDetailsPage({super.key, required this.movieID});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  ///Model
  final MovieBookingModel _model = MovieBookingModel();

  MovieVO? movieDetails;
  List<CreditVO> creditList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model.getMovieDetails(widget.movieID).then((value) {
      setState(() {
        movieDetails = value;
      });
    });
    _model.getMovieCredits(widget.movieID).then((value) {
      setState(() {
        creditList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ///movie image and info
                MovieLarImageSmallImageAndInfo(
                  movie: movieDetails,
                ),

                const SizedBox(
                  height: kMargin30,
                ),

                ///Censor , Rating, Release date and duration
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                  child: CensorRatingReleaseDateAndDuration(
                    movie: movieDetails,
                  ),
                ),

                const SizedBox(
                  height: kMargin30,
                ),

                ///Story Line
                StoryLine(
                  movie: movieDetails,
                ),

                const SizedBox(
                  height: kMargin30,
                ),

                Visibility(
                  visible: true,
                  child: CastView(
                    creditList: creditList,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),

          ///App Bar
          const BackButtonAndShareButtonWidget(),

          ///Bottom Gradient And Booking Button
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CinemaSelectionPage();
              }));
            },
            child: bookingButtonWidget(),
          ),
        ],
      )),
    );
  }

  Widget bookingButtonWidget() {
    return Align(
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
        child: const Center(child: BookingButton()),
      ),
    );
  }
}

class StoryLine extends StatelessWidget {
  final MovieVO? movie;
  const StoryLine({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            kStoryLine,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kTextRegular,
            ),
          ),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(
            movie?.overview ?? "",
            style: const TextStyle(
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
  const CastView({
    super.key,
    required this.creditList,
  });
  final List<CreditVO> creditList;

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
              itemCount: creditList.length,
              itemBuilder: (context, index) {
                return CastItemView(
                  creditVO: creditList[index],
                );
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
