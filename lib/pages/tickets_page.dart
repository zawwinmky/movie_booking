import 'package:flutter/material.dart';
import 'package:movie_booking/pages/main_page.dart';
import 'package:movie_booking/pages/ticket_cancel_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/widgets_view/ticket_confirmed_widget_view.dart';
import 'package:movie_booking/widgets_view/ticket_details_widget.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              SizedBox(
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
