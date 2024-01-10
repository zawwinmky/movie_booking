import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/font_styles.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:intl/intl.dart';
import '../widgets_view/choose_movie_time_grid_view_widget.dart';
import 'cinemas_page.dart';

class CinemaSelectionPage extends StatefulWidget {
  const CinemaSelectionPage({super.key});

  @override
  State<CinemaSelectionPage> createState() => _CinemaSelectionPageState();
}

class _CinemaSelectionPageState extends State<CinemaSelectionPage> {
  @override
  Widget build(BuildContext context) {
    List<DateTime> dateList = generateDateList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Image.asset(
              kArrow,
              width: kMargin28,
              height: kMargin28,
            ),
            const Text(
              "Yangon",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: kTextRegular2X,
              ),
            ),
            const SizedBox(
              width: kMargin25,
            ),
            const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: kMargin22,
            ),
            const SizedBox(
              width: kMargin30,
            ),
            const Icon(
              Icons.filter_alt_rounded,
              size: kMargin22,
              color: Colors.white,
            ),
            const SizedBox(
              width: kMargin5,
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ///Spacer
            const SliverToBoxAdapter(
              child: SizedBox(
                height: kMargin20,
              ),
            ),

            ///Two weeks days view

            SliverToBoxAdapter(
              child: twoWeekDaysView(dateList),
            ),

            ///Spacer
            const SliverToBoxAdapter(
              child: SizedBox(
                height: kMargin30,
              ),
            ),

            ///Cinema Types 2D, 3D,
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kMargin22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MovieTypeView(label: k2D),
                    MovieTypeView(label: k3D),
                    MovieTypeView(label: k3DImax),
                    MovieTypeView(label: k3Dox),
                  ],
                ),
              ),
            ),

            ///Spacer
            const SliverToBoxAdapter(
              child: SizedBox(
                height: kMargin30,
              ),
            ),

            ///Available, Filling fast and Almost Full
            SliverToBoxAdapter(
              child: availableAndFillingFastView(),
            ),

            ///Expandable cinema times overview
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: cinemasList.length, (context, index) {
              return ChooseCinemaTimeGridView(
                  isExpanded: false, cinemaName: cinemasList[index]);
            })),
          ],
        ),
      ),
    );
  }

  ///Function to add 14 days to list
  List<DateTime> generateDateList() {
    DateTime today = DateTime.now();
    List<DateTime> dateList = [];

    for (int i = 0; i < 14; i++) {
      dateList.add(today.add(Duration(days: i)));
    }
    return dateList;
  }

  Widget twoWeekDaysView(dateList) {
    return SizedBox(
      height: kMargin120,
      child: ListView.custom(
          scrollDirection: Axis.horizontal,
          childrenDelegate:
              SliverChildBuilderDelegate(childCount: 14, (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: kMargin10),
              width: kMargin90,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                  ),
                  color: (index == 0) ? kPrimaryColor : kColorD7D7,
                  borderRadius: BorderRadius.circular(kMargin8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: kMargin5,
                  ),
                  Container(
                    width: kMargin22,
                    height: kMargin5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMargin5),
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: kMargin10,
                  ),
                  Text(
                    (index == 0)
                        ? kToday
                        : (index == 1)
                            ? kTomorrow
                            : DateFormat.E().format(dateList[index]),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: kInter,
                      fontSize: (index == 1) ? kTextSmall : kTextRegular,
                    ),
                  ),
                  const SizedBox(
                    height: kMargin5,
                  ),
                  Text(
                    DateFormat.MMM().format(dateList[index]),
                    style: kW700Inter14,
                  ),
                  const SizedBox(
                    height: kMargin5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: kMargin10,
                          height: kMargin20,
                          decoration: const BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(kMargin10),
                                bottomRight: Radius.circular(kMargin10),
                              )),
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                        dateList[index].day.toString(),
                        style: kW700Inter16,
                      ))),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: kMargin10,
                          height: kMargin20,
                          decoration: const BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kMargin10),
                                  bottomLeft: Radius.circular(kMargin10))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kMargin10,
                  ),
                ],
              ),
            );
          })),
    );
  }

  Widget availableAndFillingFastView() {
    return Container(
      color: kColor222,
      padding: const EdgeInsets.symmetric(
          horizontal: kMargin22, vertical: kMargin10),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: kMargin8,
                height: kMargin8,
                decoration: const BoxDecoration(
                    color: kPrimaryColor, shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin5,
              ),
              Text(
                kAvailable,
                style: kInter16.copyWith(
                    fontWeight: FontWeight.w500, color: kPrimaryColor),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: kMargin8,
                height: kMargin8,
                decoration: const BoxDecoration(
                    color: kColorFA0, shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin5,
              ),
              Text(
                kFillingFast,
                style: kInter16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kColorFA0,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: kMargin8,
                height: kMargin8,
                decoration: const BoxDecoration(
                    color: kColorF0B8, shape: BoxShape.circle),
              ),
              const SizedBox(
                width: kMargin5,
              ),
              Text(
                kAlmostFull,
                style: kInter16.copyWith(
                  color: kColorF0B8,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kMarginCardMedium2, vertical: kMargin5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          color: kNowAndComingUnselectedTextColor,
          borderRadius: BorderRadius.circular(kMargin5)),
      child: Text(
        label,
        style: kW700Inter16.copyWith(color: Colors.white),
      ),
    );
  }
}
