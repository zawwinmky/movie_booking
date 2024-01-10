import 'package:flutter/material.dart';
import 'package:movie_booking/pages/cinemas_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/widgets_view/choose_movie_time_grid_view_widget.dart';

import '../utils/dimensions.dart';
import '../utils/font_styles.dart';
import '../utils/strings.dart';

class CinemaSearchPage extends StatefulWidget {
  const CinemaSearchPage({super.key});

  @override
  State<CinemaSearchPage> createState() => _CinemaSearchPageState();
}

class _CinemaSearchPageState extends State<CinemaSearchPage> {
  RangeValues _selectedRangeForPrice = const RangeValues(3500, 24000);
  RangeValues _selectedRangeForTime = const RangeValues(8, 24);
  FocusNode searchCinemaFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchCinemaFocus.dispose();
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CinemaSearchDropdownView(),
              const SizedBox(
                height: kMargin30,
              ),
              priceRangeAndPriceView(),
              rangeSliderForPrice(),
              showTimeText(),
              const SizedBox(
                height: kMargin15,
              ),
              rangeSliderForTime(),
              const SizedBox(
                height: kMargin30,
              ),
              cinemaList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cinemaList() {
    return SizedBox(
      height: kMargin500,
      child: ListView.builder(
          itemCount: cinemasList.length,
          itemBuilder: (context, index) {
            return ChooseCinemaTimeGridView(
                isExpanded: false, cinemaName: cinemasList[index]);
          }),
    );
  }

  Widget rangeSliderForTime() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        left: kMargin30,
        right: kMargin30,
      ),
      child: RangeSlider(
          values: _selectedRangeForTime,
          max: 24,
          min: 8,
          inactiveColor: kBottomUnselectedColor,
          activeColor: kPrimaryColor,
          onChanged: (RangeValues values) {
            setState(() {
              _selectedRangeForTime = values;
            });
          }),
    );
  }

  Widget rangeSliderForPrice() {
    return Padding(
      padding: const EdgeInsets.only(
          top: kMargin15, left: kMargin30, right: kMargin30, bottom: kMargin30),
      child: RangeSlider(
          values: _selectedRangeForPrice,
          max: 29500,
          min: 3500,
          inactiveColor: kBottomUnselectedColor,
          activeColor: kPrimaryColor,
          onChanged: (RangeValues values) {
            setState(() {
              _selectedRangeForPrice = values;
            });
          }),
    );
  }

  Widget showTimeText() {
    return Padding(
      padding:
          const EdgeInsets.only(left: kMargin22, right: kMargin22, bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kShowTimes,
            style: kInter14.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: kMargin20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMargin10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '8am',
                  style: kInter14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kBottomUnselectedColor,
                  ),
                ),
                Text(
                  '12pm',
                  style: kInter14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kBottomUnselectedColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget priceRangeAndPriceView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            kPriceRange,
            style: kInter14.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: kMargin20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3,500Ks',
                style: kInter14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kBottomUnselectedColor,
                ),
              ),
              Text(
                '29,500Ks',
                style: kInter14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kBottomUnselectedColor,
                ),
              ),
            ],
          ),
        ],
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
          onTapOutside: (input) {
            searchCinemaFocus.unfocus();
          },
          focusNode: searchCinemaFocus,
          cursorColor: Colors.white,
          style: kInter14.copyWith(
              color: Colors.white, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: kSearchTheCinema,
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

class CinemaSearchDropdownView extends StatefulWidget {
  const CinemaSearchDropdownView({super.key});

  @override
  State<CinemaSearchDropdownView> createState() =>
      _CinemaSearchDropdownViewState();
}

class _CinemaSearchDropdownViewState extends State<CinemaSearchDropdownView> {
  List<String> dropDownItemsForFormat = [
    "Format",
    "2D",
    "3D",
    "3D IMAX",
    "3D DBOX"
  ];
  List<String> dropDownItemsForFacilities = [
    "Facilities",
    kParking,
    kFoodLabel,
    kWheelChairLabel
  ];
  String selectedFormat = '';
  String selectedFacility = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFormat = dropDownItemsForFormat.first;
    selectedFacility = dropDownItemsForFacilities.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kMargin22, top: kMargin20),
      child: Row(
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
                value: selectedFacility,
                items: dropDownItemsForFacilities
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
                    selectedFacility = input ?? "";
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
        ],
      ),
    );
  }
}
