import 'package:flutter/material.dart';

import '../models/food_model.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

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
          top: kMargin30, left: kMargin22, right: kMargin22, bottom: kMargin70),
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
            borderRadius: BorderRadius.circular(kMargin8),
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
              const AddPlusAndMinusView(),
            ],
          ),
        );
      },
    );
  }
}

class AddPlusAndMinusView extends StatefulWidget {
  const AddPlusAndMinusView({super.key});

  @override
  State<AddPlusAndMinusView> createState() => _AddPlusAndMinusViewState();
}

class _AddPlusAndMinusViewState extends State<AddPlusAndMinusView> {
  int foodItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return (foodItemCount > 0)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    foodItemCount--;
                  });
                },
                child: Container(
                  width: kMargin25,
                  height: kMargin25,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kPlusMinusShadow,
                        offset: Offset(0, kTextSmall),
                        blurRadius: kMargin5,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: kMargin10,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin10),
                child: Text(
                  foodItemCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: kTextRegular2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    foodItemCount++;
                  });
                },
                child: Container(
                  width: kMargin25,
                  height: kMargin25,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kPlusMinusShadow,
                        offset: Offset(0, kTextSmall),
                        blurRadius: kMargin5,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: kMargin10,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                foodItemCount++;
              });
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kMarginSmall)),
                height: kMargin28,
                child: Center(
                    child: Text(
                  kFoodAddLabel.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: kTextRegular,
                    color: Colors.black,
                  ),
                ))),
          );
  }
}
