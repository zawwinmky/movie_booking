import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        title: const Row(
          children: [
            SizedBox(
              width: kMarginMedium2,
            ),
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(
              width: kMarginMedium2,
            ),
            Text(
              "Yangon",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: kTextRegular2X,
                fontFamily: kInter,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.notifications,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.qr_code_scanner,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kHomeScreenAppbarRMargin,
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: const HomePageScreenBodyView(),
    );
  }
}

class HomePageScreenBodyView extends StatelessWidget {
  const HomePageScreenBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Banner View
        SliverToBoxAdapter(
          child: BannerSectionView(),
        ),
      ],
    );
  }
}

class BannerSectionView extends StatelessWidget {
  BannerSectionView({super.key});

  final _bannerPageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Banner Page View
        SizedBox(
          height: kBannerHeight,
          child: PageView.builder(
            controller: _bannerPageController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kMarginMedium, vertical: 0),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(kMarginMedium),
                  child: Image.network(
                    "https://images.bauerhosting.com/legacy/empire-tmdb/films/75656/images/9wbXqcx6rHhoZ9Esp03C7amQzom.jpg?ar=16:9&fit=crop&crop=top",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),

        ///Spacing
        const SizedBox(
          height: kMarginMedium2,
        ),

        ///Dots Indicator
        SmoothPageIndicator(
          controller: _bannerPageController,
          count: 5,
          onDotClicked: (index) {
            _bannerPageController.animateToPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuint,
                index);
          },
          effect: const SlideEffect(
            dotHeight: kMarginMedium,
            dotWidth: kMarginMedium,
            dotColor: kInactiveDotsColor,
            activeDotColor: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
