import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/cast_item_view.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/images.dart';
import 'package:movie_booking/utils/strings.dart';

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
                  height: kMargin60,
                ),
              ],
            ),
          ),

          ///App Bar
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kMarginLarge, vertical: kMarginMedium),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: kMarginXLarge,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.share,
                  size: kMarginXLarge,
                  color: Colors.white,
                )
              ],
            ),
          ),

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
              child: const Center(child: BookingButton()),
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

class MovieLarImageSmallImageAndInfo extends StatelessWidget {
  const MovieLarImageSmallImageAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieDetailsImageHeight,
      child: Stack(
        children: [
          ///Top image large, and info view
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///Large top Image
              Image.network(
                "https://wallpapercosmos.com/w/full/7/4/0/37509-3000x1973-desktop-hd-the-shawshank-redemption-background-image.jpg",
                height: kMovieDetailsLargeImageHeight,
                fit: BoxFit.fill,
                width: double.infinity,
              ),

              const SizedBox(
                height: kMarginMedium,
              ),

              ///Movie info box
              MovieInfoAndGenresView(),
            ],
          ),

          ///Small Vertical Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kMarginMedium2, bottom: kMarginMedium2),
              child: Image.network(
                'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/71nOXiTN5yL._AC_UF894,1000_QL80_.jpg',
                width: kMovieDetailSmallImageWidth,
                height: kMovieDetailSmallImageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieInfoAndGenresView extends StatelessWidget {
  MovieInfoAndGenresView({super.key});

  final List<String> genresList = ['Action', 'Drama', 'Adventure', 'Animation'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding: const EdgeInsets.only(left: kMarginMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Movie Name and Rating
            const MovieNameAndRatingView(),
            const SizedBox(
              height: kMarginMedium2,
            ),

            ///Types
            const Text(
              "2D, 3D, 3D IMAX, 3D DBOX",
              style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular2X,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: kMarginMedium2,
            ),

            ///Genres
            Wrap(
              runSpacing: kMarginMedium,
              spacing: kMarginMedium,
              children: genresList
                  .map((e) => Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius:
                              BorderRadius.circular(kMarginCardMedium2),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kMarginMedium, vertical: kMarginSmall),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: kTextSmall,
                            color: Colors.black,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieNameAndRatingView extends StatelessWidget {
  const MovieNameAndRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Shawshank",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2X,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: kMarginMedium,
        ),

        ///Imdb logo
        Image.asset(
          kImdb,
          width: kImdbWidth,
          height: kImdbHeight,
        ),
        const Text(
          "9.7",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: kTextRegular2X,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class CensorRatingReleaseDateAndDuration extends StatelessWidget {
  const CensorRatingReleaseDateAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CensorRatingAndDurationButtonView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingAndDurationButtonView(
          label: "Release Date",
          value: "May 8, 2022",
        ),
        CensorRatingAndDurationButtonView(
          label: "Duration",
          value: '2hr 18min',
        ),
      ],
    );
  }
}

class CensorRatingAndDurationButtonView extends StatelessWidget {
  final String label;
  final String value;

  const CensorRatingAndDurationButtonView(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginCardMedium2),
        gradient: const LinearGradient(colors: [
          kMovieDetailsCensorStartColor,
          kMovieDetailsCensorEndColor
        ]),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: kTextSmall,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: kTextRegular,
                color: Colors.white,
                fontWeight: FontWeight.w700),
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

        const SizedBox(height: kMargin60,),
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
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kMarginMedium2),
              color: kPrimaryColor,
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
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
              )),
          Align(
              alignment: FractionalOffset.centerRight,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: kBackgroundColor,
                ),
              )),
        ],
      ),
    );
  }
}
