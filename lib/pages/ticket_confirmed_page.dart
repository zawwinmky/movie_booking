import 'package:flutter/material.dart';
import 'package:movie_booking/pages/main_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';
import '../utils/strings.dart';
import '../widgets_view/ticket_confirmed_widget_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  }

  Future<void> showConfirmImage() async {
    await Future.delayed(const Duration(milliseconds: 1500));
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
              ticketView(),
              successfulImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketView() {
    return Visibility(
      visible: !isVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            kTicketInfo,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: kDmSan,
              fontSize: kMargin20,
            ),
          ),
          const SizedBox(
            height: kMargin50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kMargin15),
            child: TicketConfirmedWidgetView(),
          ),
          const SizedBox(
            height: kMargin75,
          ),
          // Image.asset(
          //   kQr,
          //   color: Colors.white,
          //   width: kMargin94,
          //   height: kMargin94,
          //   fit: BoxFit.cover,
          // ),
          QrImageView(
            semanticsLabel: "Qr Code",
            dataModuleStyle: const QrDataModuleStyle(
              color: Colors.black,
              dataModuleShape: QrDataModuleShape.square,
            ),
            eyeStyle: const QrEyeStyle(
                color: Colors.black, eyeShape: QrEyeShape.square),
            data: "WKC2L96",
            size: kMargin94,
            padding: const EdgeInsets.all(5),
            backgroundColor: Colors.white,
            gapless: true,
          ),
          const SizedBox(
            height: kMargin20,
          ),
          const Text(
            "WAG5LP1C",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: kMargin20,
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
                    fontSize: kMargin20,
                    fontWeight: FontWeight.w700,
                    color: kBottomUnselectedColor)),
            TextSpan(
                text: "WKCSL96",
                style: TextStyle(
                  fontFamily: kDmSan,
                  fontSize: kMargin20,
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
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
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
    );
  }

  Widget successfulImage() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
          visible: isVisible,
          // visible: isVisible,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Image.asset(
              kSuccessful,
              width: MediaQuery.of(context).size.width * 0.85,
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}
