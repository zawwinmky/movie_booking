import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/widgets_view/ticket_confirmed_widget_view.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TicketConfirmedWidgetView(),
              SizedBox(
                height: 30,
              ),
              TicketConfirmedWidgetView(),
            ],
          ),
        ));
  }
}
