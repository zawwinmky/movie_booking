import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';

import '../utils/strings.dart';
import '../widgets_view/ticket_confirmed_widget_view.dart';

class TicketConfirmedPage extends StatefulWidget {
  const TicketConfirmedPage({super.key});

  @override
  State<TicketConfirmedPage> createState() => _TicketConfirmedPageState();
}

class _TicketConfirmedPageState extends State<TicketConfirmedPage> {
  bool isVisible = true;

  @override
  void initState() {
    showConfirmImage();
    // TODO: implement initState
    super.initState();
  }

  Future<void> showConfirmImage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Ticket Information",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: kDmSan,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: kMargin50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TicketConfirmedWidgetView(),
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Image.asset(
                          kSuccessful,
                          width: MediaQuery.of(context).size.width * 0.85,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
