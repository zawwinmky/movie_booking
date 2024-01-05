import 'package:flutter/material.dart';
import 'package:movie_booking/pages/main_page.dart';
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
    debugPrint(isVisible.toString());
    // TODO: implement initState
    super.initState();
    showConfirmImage();
    debugPrint("Hello");
    debugPrint(isVisible.toString());
  }

  Future<void> showConfirmImage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Visibility(
                visible: !isVisible,
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
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TicketConfirmedWidgetView(),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      kQr,
                      color: Colors.white,
                      width: 94,
                      height: 94,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "WAG5LP1C",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: kDmSan),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "TPIN : ",
                          style: TextStyle(
                              fontFamily: kDmSan,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kBottomUnselectedColor)),
                      TextSpan(
                          text: "WKCSL96",
                          style: TextStyle(
                            fontFamily: kDmSan,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ])),
                    const SizedBox(
                      height: 77,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const MainPage();
                        }), (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: kPrimaryColor,
                        ),
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              fontFamily: kInter),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: isVisible,
                    // visible: isVisible,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Image.asset(
                        kSuccessful,
                        width: MediaQuery.of(context).size.width * 0.85,
                        fit: BoxFit.fitWidth,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
