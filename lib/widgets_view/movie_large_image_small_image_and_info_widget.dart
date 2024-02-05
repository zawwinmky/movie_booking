import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/VOs/movie_vo.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/strings.dart';

class MovieLarImageSmallImageAndInfo extends StatelessWidget {
  final MovieVO? movie;

  const MovieLarImageSmallImageAndInfo({
    super.key,
    required this.movie,
  });

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
              CachedNetworkImage(
                imageUrl: movie?.getPosterPathWithBaseUrl() ?? "",
                errorWidget: (_, __, ___) {
                  return Image.network(
                      "https://www.shutterstock.com/image-vector/caution-exclamation-mark-white-red-260nw-1055269061.jpg");
                },
                height: kMovieDetailsLargeImageHeight,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

              const SizedBox(
                height: kMarginMedium,
              ),

              ///Movie info box
              MovieInfoAndGenresView(
                movie: movie,
              ),
            ],
          ),
          Positioned(
              top: 114,
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Image.asset(
                kPlayButton,
                width: kMargin50,
                height: kMargin50,
              )),

          ///Small Vertical Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kMarginMedium2, bottom: kMarginMedium2),
              child: CachedNetworkImage(
                imageUrl: movie?.getPosterPathWithBaseUrl() ?? "",
                width: kMovieDetailSmallImageWidth,
                height: kMovieDetailSmallImageHeight,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) {
                  return Image.network(
                      "https://www.shutterstock.com/image-vector/caution-exclamation-mark-white-red-260nw-1055269061.jpg");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieInfoAndGenresView extends StatelessWidget {
  final MovieVO? movie;
  MovieInfoAndGenresView({super.key, required this.movie});

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
            MovieNameAndRatingView(
              movie: movie,
            ),
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
              children: movie?.genres
                      ?.take(5)
                      .map((value) => value.name)
                      .map((e) => Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.circular(kMarginCardMedium2),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kMarginMedium,
                                vertical: kMarginSmall),
                            child: Text(
                              e ?? "",
                              style: const TextStyle(
                                fontSize: kTextSmall,
                                color: Colors.black,
                              ),
                            ),
                          ))
                      .toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}

class MovieNameAndRatingView extends StatelessWidget {
  final MovieVO? movie;
  const MovieNameAndRatingView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            movie?.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: kTextRegular,
              fontWeight: FontWeight.w700,
            ),
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
        Text(
          movie?.getRatingWithTwoDeci() ?? "",
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: kTextRegular2X,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: kMargin5,
        ),
      ],
    );
  }
}
