import 'package:flutter/material.dart';
import 'package:movie_booking/pages/login_page.dart';
import 'package:movie_booking/pages/main_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

class ChooseRegionPage extends StatelessWidget {
  const ChooseRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kRegionBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: kMargin30,
            ),
            const Text(
              kPickRegion,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: kMargin18,
                      color: kPrimaryColor,
                    ),
                  ],
                  fontSize: kTextRegular2X,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor),
            ),
            const SizedBox(
              height: kMarginMedium3,
            ),

            ///Search Box
            const RegionSearchTextField(),

            const SizedBox(
              height: kMargin30,
            ),

            ///City Vector
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: kMargin22),
                  child: Image.asset(
                    kCity,
                    width: kCityWidth,
                    height: kCityHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            ///Cities Text
            Container(
              width: double.infinity,
              height: kMargin40,
              color: kCitiesTextBackgroundColor,
              padding: const EdgeInsets.only(
                  left: kMargin22, top: kTextXSmall, bottom: kTextXSmall),
              child: const Text(
                kCityText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: kTextRegular2X,
                  color: Colors.white,
                ),
              ),
            ),

            ///City list
            CitiesListView(),
          ],
        ),
      ),
    ));
  }
}

class CitiesListView extends StatelessWidget {
  final List<String> citiesList = [
    "Yangon",
    "Mandalay",
    "Taunggyi",
    "Magway",
    "Monywa",
    "Lashio",
    "Pathein",
    "Mawlamyine"
  ];

  CitiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: citiesList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kMargin22,
                vertical: kMarginMedium3,
              ),
              decoration: const BoxDecoration(
                  color: kRegionBackgroundColor,
                  border: Border(
                      bottom: BorderSide(
                    width: 1,
                    color: kCitiesTextBackgroundColor,
                  ))),
              child: Text(
                citiesList[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular2X,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RegionSearchTextField extends StatelessWidget {
  const RegionSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: kMargin300,
              height: kMargin50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kSearchRegionStartColor, kSearchRegionEndColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(kTextSmall),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIconColor: kPrimaryColor,
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      size: kMargin22,
                    ),
                    hintText: kPickRegionHintText,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: kMargin18),
                    hintStyle: TextStyle(
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w400,
                      color: kRegionHintTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: kMarginMedium3,
          ),
          Container(
            width: kMargin50,
            height: kMargin50,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(kTextSmall)),
            child: Center(
              child: Image.asset(
                kArrow,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
