import 'package:flutter/material.dart';
import 'package:movie_booking/pages/payment_method_page.dart';
import 'package:movie_booking/utils/colors.dart';

class TicketBookingConfirm extends StatelessWidget {
  const TicketBookingConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PaymentMethodPage();
                }));
              },
              child: Text("Go to Payment page")),
        ),
      ),
    );
  }
}
