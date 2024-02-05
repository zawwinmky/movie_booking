import 'package:flutter/material.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';
import 'package:movie_booking/pages/coming_soon_movie_page.dart';
import 'package:movie_booking/pages/movie_details_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';

import '../utils/images.dart';

class MovieListItemView extends StatelessWidget {
  const MovieListItemView(
      {super.key,
      required this.isComingSoonSelected,
      required this.movie,
      required this.movieID});

  final bool isComingSoonSelected;
  final MovieVO movie;
  final String movieID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isComingSoonSelected) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ComingSoonMoviePage(
              movieID: movieID,
            );
          }));
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MovieDetailsPage(
              movieID: movieID,
            );
          }));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            ///MoviePoster and Gradient
            Stack(
              children: [
                ///Poster
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kMarginMedium),
                    topRight: Radius.circular(kMarginMedium),
                  ),
                  child: Image.network(
                    movie.getPosterPathWithBaseUrl(),
                    fit: BoxFit.cover,
                    height: kMoviePosterHeight,
                    width: double.infinity,
                  ),
                ),

                ///Gradient
                Container(
                  height: kMoviePosterHeight,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                    visible: isComingSoonSelected,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: kMarginMedium, right: kMarginMedium),
                      child: Container(
                        width: kMarginXLarge,
                        height: kMarginXLarge,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kMarginMedium),
                        ),
                        child: const Center(
                          child: Text(
                            "8th\nAUG",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kNowAndComingUnselectedTextColor,
                              fontSize: kTextSmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///Movie Name and ID
            MovieNameAndID(
              movie: movie,
            ),

            ///Spacer
            const SizedBox(
              height: kMarginMedium2,
            ),

            ///Additional Info View
            const AdditionalInfoView(),
          ],
        ),
      ),
    );
  }
}

class MovieNameAndID extends StatelessWidget {
  const MovieNameAndID({super.key, required this.movie});

  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Movie Title
          Expanded(
            child: Text(
              movie.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: kTextSmall,
              ),
            ),
          ),
          const Spacer(),

          ///IMDb
          Image.asset(
            kImdb,
            width: kMarginXLarge,
            height: kMarginMedium3,
            fit: BoxFit.cover,
          ),

          ///Rating
          Text(
            movie.getRatingWithTwoDeci(),
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class AdditionalInfoView extends StatelessWidget {
  const AdditionalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        children: [
          const Text(
            "U/A",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: kTextSmall,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: kMarginMedium,
          ),

          ///Circle Dot
          Container(
            width: kMargin5,
            height: kMargin5,
            decoration: const BoxDecoration(
                color: kCircleColor, shape: BoxShape.circle),
          ),

          ///Spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          ///Text
          const Text(
            "2D, 3D, 3D IMAX",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
