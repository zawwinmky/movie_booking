import 'package:flutter/material.dart';
import 'package:movie_booking/data/models/movie_booking_model.dart';
import 'package:movie_booking/list_items/movie_list_item_view.dart';
import 'package:movie_booking/pages/movie_search_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/VOs/movie_vo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///App Bar View
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        leading: appBarLeadingView(),
        title: appBarTitleView(),
        actions: [
          const SizedBox(
            width: kMargin22,
          ),
          const SizedBox(
            width: kMargin20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                // return const MovieSearchPage();
                return Container();
              }));
            },
            child: const Icon(
              Icons.search_sharp,
              size: kMargin22,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: kMarginXLarge,
          ),
          const Icon(
            Icons.notifications,
            size: kMargin22,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMargin22,
          ),
          Image.asset(
            kScanIconNew,
            height: kMargin55,
            width: kMargin55,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMargin18,
          ),
        ],
      ),

      backgroundColor: kBackgroundColor,

      ///Body View
      body: const SafeArea(
        child: HomePageScreenBodyView(),
      ),
    );
  }

  Widget appBarLeadingView() {
    return Padding(
      padding: const EdgeInsets.only(
          top: kMargin10, bottom: kMargin10, left: kMargin22),
      child: Image.asset(
        kArrow,
        width: kMargin28,
        height: kMargin28,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget appBarTitleView() {
    return const Text(
      "Yangon",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: kTextRegular2X,
        fontFamily: kInter,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class HomePageScreenBodyView extends StatefulWidget {
  const HomePageScreenBodyView({super.key});

  @override
  State<HomePageScreenBodyView> createState() => _HomePageScreenBodyViewState();
}

class _HomePageScreenBodyViewState extends State<HomePageScreenBodyView> {
  ///Model
  final MovieBookingModel _model = MovieBookingModel();

  ///Now Playing or Coming Soon
  String selectedText = kNowShowingLabel;

  List<MovieVO> nowPlayingMovieList = [];
  List<MovieVO> comingSoonMovieList = [];
  List<MovieVO> moviesToShow = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _model.getNowPlayingMovieList().then((value) {
      setState(() {
        nowPlayingMovieList = value;
        moviesToShow = value;
      });
    });

    _model.getComingSoonMovieList().then((value) {
      comingSoonMovieList = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ///Banner View
        SliverToBoxAdapter(
          child: BannerSectionView(),
        ),

        ///Spacing
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        ///NowShowingAndComingSoonTabBar
        SliverToBoxAdapter(
          child: NowShowingAndComingSoonTabBar(
            selectedText: selectedText,
            onTapNowShowingAndComingSoon: (text) {
              setState(() {
                selectedText = text;

                ///Set Movie to show list
                if (selectedText == kNowShowingLabel) {
                  moviesToShow = nowPlayingMovieList;
                } else {
                  moviesToShow = comingSoonMovieList;
                }
              });
            },
          ),
        ),

        ///Spacing
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        ///Movie Grid View
        (moviesToShow.isEmpty)
            ? const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              )
            : SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return MovieListItemView(
                        isComingSoonSelected: selectedText == kComingSoonLabel,
                        movie: moviesToShow[index],
                        movieID: moviesToShow[index].id.toString(),
                      );
                    }, childCount: moviesToShow.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: kMarginMedium3,
                            mainAxisSpacing: kMarginMedium3,
                            crossAxisCount: 2,
                            mainAxisExtent: kMovieListItemHeight)),
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
                  horizontal: kMarginMedium,
                ),
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

class NowShowingAndComingSoonTabBar extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapNowShowingAndComingSoon;

  const NowShowingAndComingSoonTabBar(
      {super.key,
      required this.selectedText,
      required this.onTapNowShowingAndComingSoon});

  @override
  Widget build(BuildContext context) {
    ///Now Showing And Coming Soon Tab Bar
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMargin5),
        gradient: const RadialGradient(colors: [
          kNowAndComingGradientStartColor,
          kNowAndComingGradientEndColor
        ], radius: 7.5, center: Alignment(0, -0.02)),
      ),
      child: Row(
        children: [
          ///NowShowingButton
          Expanded(
              child: NowShowingAndComingSoonButtonView(
                  onTapButton: () {
                    onTapNowShowingAndComingSoon(kNowShowingLabel);
                  },
                  isSelected: selectedText == kNowShowingLabel,
                  label: kNowShowingLabel)),

          ///Coming Soon Button
          Expanded(
              child: NowShowingAndComingSoonButtonView(
                  onTapButton: () {
                    onTapNowShowingAndComingSoon(kComingSoonLabel);
                  },
                  isSelected: selectedText == kComingSoonLabel,
                  label: kComingSoonLabel)),
        ],
      ),
    );
  }
}

class NowShowingAndComingSoonButtonView extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapButton;
  const NowShowingAndComingSoonButtonView(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.onTapButton});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapButton();
      },
      child: Container(
        margin: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
          color: (isSelected) ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(kMarginSmall),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected)
                  ? kNowAndComingSelectedTextColor
                  : kNowAndComingUnselectedTextColor,
              fontSize: kTextRegular2X,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
