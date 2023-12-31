import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/movie_list_item_view.dart';
import 'package:movie_booking/pages/movie_details_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
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
      ///App Bar View
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

      ///Body View
      body: const HomePageScreenBodyView(),
    );
  }
}

class HomePageScreenBodyView extends StatefulWidget {
  const HomePageScreenBodyView({super.key});

  @override
  State<HomePageScreenBodyView> createState() => _HomePageScreenBodyViewState();
}

class _HomePageScreenBodyViewState extends State<HomePageScreenBodyView> {
  String selectedText = kNowShowingLabel;

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
            selectedText: this.selectedText,
            onTapNowShowingAndComingSoon: (text) {
              setState(() {
                selectedText = text;
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
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const MovieDetailsPage();
                    }));
                  },
                  child: MovieListItemView(
                    isComingSoonSelected: selectedText == kComingSoonLabel,
                  ),
                );
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: kMarginMedium3,
                  mainAxisSpacing: kMarginMedium3,
                  crossAxisCount: 2,
                  mainAxisExtent: kMovieListItemHeight)),
        )
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

class NowShowingAndComingSoonTabBar extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapNowShowingAndComingSoon;

  const NowShowingAndComingSoonTabBar({
      super.key,
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
