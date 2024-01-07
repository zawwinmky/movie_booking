import 'package:flutter/material.dart';
import 'package:movie_booking/pages/ticket_cancel_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/ticket_confirmed_widget_view.dart';

import '../utils/dimensions.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///App Bar View
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          actions: [
            const Icon(
              Icons.search_sharp,
              size: kMargin22,
              color: Colors.white,
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
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: kMargin20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const TicketCancelPage();
                  }));
                },
                child: const TicketConfirmedWidgetView(),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const TicketCancelPage();
                  }));
                },
                child: const TicketConfirmedWidgetView(),
              ),
            ],
          ),
        ));
  }
}
