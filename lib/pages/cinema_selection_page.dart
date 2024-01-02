import 'package:flutter/material.dart';
import 'package:movie_booking/pages/grab_a_bite_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/utils/text_style.dart';

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
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const GrabABitePage();
                  }));
                },
                child: const Text("Go to Next")),
            const Spacer(),
            Image.asset(kArrow),
            Center(
              child: Text(
                "Yangon",
                style: normalTextStyle,
              ),
            ),
            const Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
            const Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
