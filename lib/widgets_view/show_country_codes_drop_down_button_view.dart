import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/fonts.dart';

class ShowCountryCodeDropdownWidget extends StatefulWidget {
  const ShowCountryCodeDropdownWidget({super.key});

  @override
  State<ShowCountryCodeDropdownWidget> createState() =>
      _ShowCountryCodeDropdownWidgetState();
}

class _ShowCountryCodeDropdownWidgetState
    extends State<ShowCountryCodeDropdownWidget> {
  String selectedCountryCode = "";
  List<String> countryCodeList = ['+95', '+1', '+855', '+65', '+66', "+81"];

  @override
  void initState() {
    selectedCountryCode = countryCodeList.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        underline: Container(
          color: Colors.black,
        ),
        dropdownColor: kBackgroundColor,
        value: selectedCountryCode,
        items: countryCodeList
            .map((e) => DropdownMenuItem(
                value: e,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: kInter,
                        fontSize: kTextRegular2X,
                      ),
                    ),
                  ),
                )))
            .toList(),
        onChanged: (input) {
          setState(() {
            selectedCountryCode = input ?? "";
          });
        });
  }
}
