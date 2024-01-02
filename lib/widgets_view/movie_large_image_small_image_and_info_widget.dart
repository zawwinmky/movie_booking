


import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/strings.dart';





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
          Positioned(
              top: 114,
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,

              child: Image.asset(
                kPlayButton,
                width: kMargin50,
                height:kMargin50,
              )),

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