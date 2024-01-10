import 'package:flutter/material.dart';
import 'package:movie_booking/list_items/movie_list_item_view.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/font_styles.dart';
import 'package:movie_booking/utils/strings.dart';

import '../utils/dimensions.dart';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        leading: leadingWidget(),
        titleSpacing: 0,
        title: titleWidget(),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMargin22),
          child: Column(
            children: [
              const SizedBox(
                height: kMargin5,
              ),
              const DropDownMovieFilterListView(),
              const SizedBox(
                height: kMargin30,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 3,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: kMarginMedium3,
                            crossAxisSpacing: kMarginMedium3,
                            mainAxisExtent: kMovieListItemHeight,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return const MovieListItemView(
                          isComingSoonSelected: false);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget leadingWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: kMargin22,
        color: Colors.white,
      ),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        const Icon(
          Icons.search_sharp,
          size: kMargin22,
          color: Colors.white,
        ),
        const SizedBox(
          width: kMargin10,
        ),
        Expanded(
            child: TextField(
          cursorColor: Colors.white,
          style: kInter14.copyWith(
              color: Colors.white, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: kSearchTheMovie,
              hintStyle: kInter14.copyWith(
                color: kColor444,
                fontWeight: FontWeight.w400,
              )),
        )),
        const Icon(
          Icons.filter_alt,
          size: kMargin22,
          color: kPrimaryColor,
        ),
        const SizedBox(
          width: kMargin22,
        ),
      ],
    );
  }
}

class DropDownMovieFilterListView extends StatefulWidget {
  const DropDownMovieFilterListView({super.key});

  @override
  State<DropDownMovieFilterListView> createState() =>
      _DropDownMovieFilterListViewState();
}

class _DropDownMovieFilterListViewState
    extends State<DropDownMovieFilterListView> {
  List<String> dropDownItemsForGenres = [
    "Genres",
    "Action",
    "Comedy",
    "Romance",
    "Thriller"
  ];
  List<String> dropDownItemsForFormat = [
    "Format",
    "2D",
    "3D",
    "3D IMAX",
    "3D DBOX"
  ];
  List<String> dropDownItemsForMonths = [
    "Month",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    'July',
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  String selectedGenres = '';
  String selectedFormat = '';
  String selectedMonth = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGenres = dropDownItemsForGenres.first;
    selectedFormat = dropDownItemsForFormat.first;
    selectedMonth = dropDownItemsForMonths.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: kMargin27,
          padding: const EdgeInsets.symmetric(
            horizontal: kMargin10,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kMargin8)),
          child: DropdownButton(
              underline: Container(),
              value: selectedGenres,
              items: dropDownItemsForGenres
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: kInter14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )))
                  .toList(),
              onChanged: (input) {
                setState(() {
                  selectedGenres = input ?? "";
                });
              }),
        ),
        const SizedBox(
          width: kMargin10,
        ),
        Container(
          height: kMargin27,
          padding: const EdgeInsets.symmetric(
            horizontal: kMargin10,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kMargin8)),
          child: DropdownButton(
              underline: Container(),
              value: selectedFormat,
              items: dropDownItemsForFormat
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: kInter14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )))
                  .toList(),
              onChanged: (input) {
                setState(() {
                  selectedFormat = input ?? "";
                });
              }),
        ),
        const SizedBox(
          width: kMargin10,
        ),
        Container(
          height: kMargin27,
          padding: const EdgeInsets.symmetric(
            horizontal: kMargin10,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kMargin8)),
          child: DropdownButton(
              underline: Container(),
              value: selectedMonth,
              items: dropDownItemsForMonths
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: kInter14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )))
                  .toList(),
              onChanged: (input) {
                setState(() {
                  selectedMonth = input ?? "";
                });
              }),
        ),
        const SizedBox(
          width: kMargin10,
        ),
      ],
    );
  }
}
