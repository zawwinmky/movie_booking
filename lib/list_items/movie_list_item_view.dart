import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';

import '../utils/images.dart';

class MovieListItemView extends StatelessWidget {
  const MovieListItemView({super.key, required this.isComingSoonSelected});

  final bool isComingSoonSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(kMarginMedium),
      ),
      child: Column(
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
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero),
                child: Image.network(
                  "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2fa44b15344917.5628fd261893b.jpg",
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
                    padding: const EdgeInsets.only(top: kMarginMedium,right: kMarginMedium),
                    child: Container(
                      width: kMarginXLarge,
                      height: kMarginXLarge,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kMarginMedium),
                      ),
                      child: const Center(
                        child: Text(
                          "8th\nAUG",textAlign: TextAlign.center,
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
          const MovieNameAndID(),

          ///Spacer
          const SizedBox(
            height: kMarginMedium2,
          ),

          ///Additional Info View
          const AdditionalInfoView(),
        ],
      ),
    );
  }
}

class MovieNameAndID extends StatelessWidget {
  const MovieNameAndID({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Shawshank",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
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
          const Text(
            "9.7",
            style: TextStyle(
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
