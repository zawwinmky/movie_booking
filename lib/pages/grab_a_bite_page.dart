import 'package:flutter/material.dart';
import 'package:movie_booking/pages/check_out_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';
import 'package:movie_booking/widgets_view/add_plus_and_minus_view.dart';
import '../models/food_model.dart';

class GrabABitePage extends StatefulWidget {
  const GrabABitePage({super.key});

  @override
  State<GrabABitePage> createState() => _GrabABitePageState();
}

class _GrabABitePageState extends State<GrabABitePage> {
  bool isVisible = false;
  late String tabBarLabel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackgroundColor,
            title: titleWidgetView(),
            bottom: TabBar(
                dividerColor: kBackgroundColor,
                isScrollable: true,
                dividerHeight: kMargin20,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    style: BorderStyle.solid,
                    width: kMarginSmall,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: kPrimaryColor,
                tabs: [
                  Tab(
                    child: tabBarItem(
                      tabBarLabel = kAllTabLabel,
                    ),
                  ),
                  Tab(
                    child: tabBarItem(tabBarLabel = kComboTabLabel),
                  ),
                  Tab(
                    child: tabBarItem(tabBarLabel = kPopCornTabLabel),
                  ),
                  Tab(
                    child: tabBarItem(tabBarLabel = kSnackTabLabel),
                  ),
                  Tab(
                    child: tabBarItem(tabBarLabel = kBeverageTabLabel),
                  ),
                ]),
          ),
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(children: [
              ///Body Food List Grid View
              TabBarView(children: [
                FoodGridView(foodList: foodList),
                FoodGridView(foodList: foodList),
                FoodGridView(foodList: foodList),
                FoodGridView(foodList: foodList),
                FoodGridView(foodList: foodList),
              ]),

              ///black background color for bottom button
              bgColorBoxForBottomButton(),

              ///Food total preview widget
              foodTotalPreviewBox(),

              ///Bottom Cart and Go to next page button
              bottomButtonAndCartButtonWidget(),
            ]),
          ),
        ));
  }

  Widget tabBarItem(tabBarLabel) {
    return Text(
      tabBarLabel,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: kTextRegular2X,
      ),
    );
  }

  Widget bgColorBoxForBottomButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: kMargin70,
        color: Colors.black,
      ),
    );
  }

  Widget titleWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kMargin22, vertical: kMargin22),
      child: Row(
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
          const SizedBox(
            width: kMargin50,
          ),
          const Text(
            kGrabABiteLabel,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: kMargin22,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.search_sharp,
            color: Colors.white,
          ),
          const SizedBox(
            width: kMargin30,
          ),

          ///Navigate to Ticket Booking Confirm
          TextButton(
            onPressed: () {
              ///To Navigate
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CheckOutPage();
              }));
            },
            child: Text(
              kSkipButtonLabel.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: kTextRegular3X),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButtonAndCartButtonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kMargin50,
        margin: const EdgeInsets.symmetric(
          horizontal: kMargin22,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTextXSmall),
          color: kPrimaryColor,
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: kMarginMedium3, vertical: kTextXSmall),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kCartIcon,
                      color: Colors.black,
                      height: kMargin25,
                      width: kMargin25,
                    ),
                    Icon(
                      !isVisible
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const CheckOutPage();
                  }));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "10,000Ks",
                      style: TextStyle(
                        fontSize: kTextRegular2X,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodTotalPreviewBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: isVisible,
        child: Container(
          padding: const EdgeInsets.only(
              bottom: kMargin70,
              top: kTextXSmall,
              left: kMargin22,
              right: kMargin22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginMedium3),
            color: kBackgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "Coca Cola",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: kMargin8),
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "3,000Ks",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: kTextRegular,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kMargin10,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "Burger Combo1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: kMargin8),
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "3,000Ks",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: kTextRegular,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kMargin10,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "Coca Cola",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: kMargin8),
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          width: kMargin23,
                          height: kMargin23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: kMargin10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "3,000Ks",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: kTextRegular,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<FoodModel> foodList = [
  FoodModel(foodName: "Coca Cola", foodPrice: "1,000Ks", foodImage: kCocaCola),
  FoodModel(foodName: "Pepsi", foodPrice: "1,000Ks", foodImage: kPepsi),
  FoodModel(foodName: "Potato Chips", foodPrice: "3,000Ks", foodImage: kPotato),
  FoodModel(
      foodName: "Burger Combo1", foodPrice: "5,000Ks", foodImage: kCombo1),
  FoodModel(
      foodName: "Burger Combo2", foodPrice: "10,000Ks", foodImage: kCombo2),
  FoodModel(foodName: "Pizza", foodPrice: "7,000Ks", foodImage: kPizza),
  FoodModel(foodName: "Coca Cola", foodPrice: "1,000Ks", foodImage: kCocaCola),
  FoodModel(foodName: "Pepsi", foodPrice: "1,000Ks", foodImage: kPepsi),
  FoodModel(foodName: "Potato Chips", foodPrice: "3,000Ks", foodImage: kPotato),
  FoodModel(
      foodName: "Burger Combo1", foodPrice: "5,000Ks", foodImage: kCombo1),
  FoodModel(
      foodName: "Burger Combo2", foodPrice: "10,000Ks", foodImage: kCombo2),
  FoodModel(foodName: "Pizza", foodPrice: "7,000Ks", foodImage: kPizza),
];
