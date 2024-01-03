import 'package:flutter/material.dart';
import 'package:movie_booking/pages/grab_a_bite_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/utils/text_style.dart';

import '../widgets_view/cinmea_over_view_widget_expandable.dart';

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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 115,
                child: DateShower(
                  dateDay: DateTime.now().day,
                  dateMonth: DateTime.now().month,
                ),
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

            ///Expandable cinema overview
            const SliverToBoxAdapter(
              child: CinemaOverViewWidget(
                cinemaName: "JCGV: Junction City",
                isExpanded: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: CinemaOverViewWidget(
                cinemaName: "JCGV: Junction Square",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: CinemaOverViewWidget(
                cinemaName: "JCGV: Sein Gay Har",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: CinemaOverViewWidget(
                cinemaName: "Mingala Cineplex",
                isExpanded: false,
              ),
            ),
            const SliverToBoxAdapter(
              child: CinemaOverViewWidget(
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

class DateShower extends StatelessWidget {
  const DateShower({super.key, required this.dateDay, required this.dateMonth});

  final int dateDay;
  final int dateMonth;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int) {
        return Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(top: 6),
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
                "Today",
                style: normalTextStyle,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                dateMonth == 1
                    ? "Jan"
                    : dateMonth == 2
                        ? "Feb"
                        : dateMonth == 3
                            ? "March"
                            : dateMonth == 4
                                ? "April"
                                : dateMonth == 5
                                    ? "May"
                                    : dateMonth == 6
                                        ? "June"
                                        : dateMonth == 7
                                            ? "July"
                                            : dateMonth == 8
                                                ? "Aug"
                                                : dateMonth == 9
                                                    ? "Sep"
                                                    : dateMonth == 10
                                                        ? "Oct"
                                                        : dateMonth == 11
                                                            ? "Nov"
                                                            : dateMonth == 12
                                                                ? "Dec"
                                                                : "N/A",
                style: normalTextStyle,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                dateDay.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
      itemCount: 14,
    );
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
