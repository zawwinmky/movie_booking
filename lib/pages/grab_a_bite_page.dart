import 'package:flutter/material.dart';
import 'package:movie_booking/pages/ticket_booking_confirmation_page.dart';
import 'package:movie_booking/utils/colors.dart';
import 'package:movie_booking/utils/dimensions.dart';
import 'package:movie_booking/utils/strings.dart';
import '../models/food_model.dart';

class GrabABitePage extends StatefulWidget {
  const GrabABitePage({super.key});

  @override
  State<GrabABitePage> createState() => _GrabABitePageState();
}

class _GrabABitePageState extends State<GrabABitePage> {
  final List<FoodModel> foodList = [
    FoodModel(
        foodName: "Coca Cola", foodPrice: "1,000Ks", foodImage: kCocaCola),
    FoodModel(foodName: "Pepsi", foodPrice: "1,000Ks", foodImage: kPepsi),
    FoodModel(
        foodName: "Potato Chips", foodPrice: "3,000Ks", foodImage: kPotato),
    FoodModel(
        foodName: "Burger Combo1", foodPrice: "5,000Ks", foodImage: kCombo1),
    FoodModel(
        foodName: "Burger Combo2", foodPrice: "10,000Ks", foodImage: kCombo2),
    FoodModel(foodName: "Pizza", foodPrice: "7,000Ks", foodImage: kPizza),
    FoodModel(
        foodName: "Coca Cola", foodPrice: "1,000Ks", foodImage: kCocaCola),
    FoodModel(foodName: "Pepsi", foodPrice: "1,000Ks", foodImage: kPepsi),
    FoodModel(
        foodName: "Potato Chips", foodPrice: "3,000Ks", foodImage: kPotato),
    FoodModel(
        foodName: "Burger Combo1", foodPrice: "5,000Ks", foodImage: kCombo1),
    FoodModel(
        foodName: "Burger Combo2", foodPrice: "10,000Ks", foodImage: kCombo2),
    FoodModel(foodName: "Pizza", foodPrice: "7,000Ks", foodImage: kPizza),
  ];
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackgroundColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMargin5),
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const TicketBookingConfirm();
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
            ),
            bottom: const TabBar(
                isScrollable: true,
                dividerHeight: 0,
                indicator: UnderlineTabIndicator(
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
                    child: Text(
                      kAllTabLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: kTextRegular2X,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      kComboTabLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: kTextRegular2X,
                      ),
                    ),
                  ),
                  Tab(
                      child: Text(
                    kPopCornTabLabel,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: kTextRegular2X,
                    ),
                  )),
                  Tab(
                    child: Text(
                      kSnackTabLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: kTextRegular2X,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      kBeverageTabLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: kTextRegular2X,
                      ),
                    ),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: kMargin70,
                  color: Colors.black,
                ),
              ),

              ///Food total preview widget
              Align(
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
                              flex: 5,
                              child: Text(
                                "Coca Cola",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      icon: const Icon(Icons.remove)),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMargin5),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kTextRegular2X,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                ],
                              ),
                            ),
                            const Expanded(
                              flex: 4,
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
                          height: kMargin5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text(
                                "Coca Cola",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      icon: const Icon(Icons.remove)),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMargin5),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kTextRegular2X,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                ],
                              ),
                            ),
                            const Expanded(
                              flex: 4,
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
                          height: kMargin5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text(
                                "Burger Combo1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      icon: const Icon(Icons.remove)),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMargin5),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kTextRegular2X,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                ],
                              ),
                            ),
                            const Expanded(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "10,000Ks",
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
                          height: kMargin5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///Bottom Cart and Go to next page button
              Align(
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
                                width: 27,
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
                              return const TicketBookingConfirm();
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
              ),
            ]),
          ),
        ));
  }
}

class FoodGridView extends StatelessWidget {
  const FoodGridView({
    super.key,
    required this.foodList,
  });

  final List<FoodModel> foodList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
          left: kMargin22, right: kMargin22, bottom: kMargin70),
      itemCount: foodList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: kFoodBoxHeight,
          crossAxisCount: 2,
          mainAxisSpacing: kMargin25,
          crossAxisSpacing: kMargin25),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(kTextXSmall),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [kFoodColorStart, kFoodColorEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  foodList[index].foodImage,
                  width: kFoodImageSize,
                  height: kFoodImageSize,
                ),
              ),
              Text(
                foodList[index].foodName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextSmall,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                foodList[index].foodPrice,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: kTextSmall,
                ),
              ),
              const SizedBox(
                height: kTextXSmall,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kMarginSmall)),
                    height: kMargin35,
                    child: Center(
                        child: Text(
                      kFoodAddLabel.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: kTextRegular,
                        color: Colors.black,
                      ),
                    ))),
              ),
            ],
          ),
        );
      },
    );
  }
}
