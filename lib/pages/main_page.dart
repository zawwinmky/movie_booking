import 'package:flutter/material.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex=0;
  List<Widget> homeScreenWidgets=[ ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:_getBottomNavigationBarItems(),
        currentIndex: currentIndex,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottomUnselectedColor,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex){
          setState(() {
            currentIndex=selectedIndex;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems(){
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.movie,size: kMarginXLarge,),label: kMovieLabel),
      const BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket,size: kMarginXLarge,),label: kCinemasLabel),
      const BottomNavigationBarItem(icon: Icon(Icons.camera_indoor_outlined,size: kMarginXLarge,),label: kTicketsLabel),
      const BottomNavigationBarItem(icon: Icon(Icons.person,size: kMarginXLarge,),label: kProfileLabel),
    ];
  }

}