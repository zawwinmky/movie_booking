import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:intl/intl.dart';
import '../widgets_view/choose_movie_time_grid_view_widget.dart';

class CinemaSelectionPage extends StatefulWidget {
  const CinemaSelectionPage({super.key});

  @override
  State<CinemaSelectionPage> createState() => _CinemaSelectionPageState();
}

class _CinemaSelectionPageState extends State<CinemaSelectionPage> {
  @override
  Widget build(BuildContext context) {
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
              width: 28,
              height: 28,
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
              width: 25,
            ),
            const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(
              width: kMargin30,
            ),
            const Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),

            ///Two weeks days view
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 115,
                child: TwoWeeksDateViewWidget(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kMargin22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MovieTypeView(label: "2D"),
                    MovieTypeView(label: "3D"),
                    MovieTypeView(label: "3D IMAX"),
                    MovieTypeView(label: "3D DBOX"),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),

            ///Available, Filling fast and Almost Full
            SliverToBoxAdapter(
              child: Container(
                color: const Color(0xFF222222),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: kPrimaryColor, shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Available",
                          style: TextStyle(
                            color: kPrimaryColor,
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
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFF7A00), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Filling Fast",
                          style: TextStyle(
                            color: Color(0xFFFF7A00),
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
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFF00B8), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Almost Full",
                          style: TextStyle(
                            color: Color(0xFFFF00B8),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///Expandable cinema times overview
            const SliverToBoxAdapter(
              child: ChooseMovieTimesGridExpandView(
                cinemaName: "JCGV: Junction City",
                isExpanded: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: ChooseMovieTimesGridExpandView(
                cinemaName: "JCGV: Junction Square",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: ChooseMovieTimesGridExpandView(
                cinemaName: "JCGV: Sein Gay Har",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: ChooseMovieTimesGridExpandView(
                cinemaName: "Mingala Cineplex",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: ChooseMovieTimesGridExpandView(
                cinemaName: "Mingala Diamond",
                isExpanded: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoWeeksDateViewWidget extends StatelessWidget {
  const TwoWeeksDateViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateList = generateDateList();

    return ListView.builder(
      itemCount: dateList.length,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: kPrimaryColor,
                  blurRadius: 5,
                ),
              ],
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding:
                const EdgeInsets.only(top: 6, bottom: 10, left: 7, right: 7),
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 9,
                  width: 70,
                ),
                const Text(
                  "Today",
                  style: TextStyle(
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                      fontFamily: kInter,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  DateFormat.MMM().format(dateList[index]),
                  style: const TextStyle(
                      fontSize: kTextRegular,
                      fontFamily: kInter,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  dateList[index].day.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        } else if (index == 1) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD7D7D7),
              borderRadius: BorderRadius.circular(8),
            ),
            padding:
                const EdgeInsets.only(top: 6, bottom: 10, left: 7, right: 7),
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 9,
                  width: 70,
                ),
                const Text(
                  "Tomorrow",
                  style: TextStyle(
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                      fontFamily: kInter,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  DateFormat.MMM().format(dateList[index]),
                  style: const TextStyle(
                      fontSize: kTextRegular,
                      fontFamily: kInter,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  dateList[index].day.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD7D7D7),
              borderRadius: BorderRadius.circular(8),
            ),
            padding:
                const EdgeInsets.only(top: 6, bottom: 10, left: 7, right: 7),
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 9,
                  width: 70,
                ),
                Text(
                  " ${DateFormat.E().format(dateList[index]).toString()} ",
                  style: const TextStyle(
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                      fontFamily: kInter,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  DateFormat.MMM().format(dateList[index]),
                  style: const TextStyle(
                      fontSize: kTextRegular,
                      fontFamily: kInter,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  dateList[index].day.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: kInter,
                      fontSize: kTextRegular2X,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  List<DateTime> generateDateList() {
    DateTime today = DateTime.now();
    List<DateTime> dateList = [];

    for (int i = 0; i < 14; i++) {
      dateList.add(today.add(Duration(days: i)));
    }
    return dateList;
  }
}

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: const Color(0xFF555555),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: kTextRegular2X,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
