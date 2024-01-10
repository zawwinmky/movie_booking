import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: itemCount > 0
              ? Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        itemCount--;
                        setState(() {});
                        debugPrint(itemCount.toString());
                      },
                      child: Container(
                        color: Colors.green,
                        width: 100,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Minus",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : itemCount <= 0
                  ? Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            itemCount++;
                            setState(() {});
                            debugPrint(itemCount.toString());
                          },
                          child: Container(
                            color: Colors.green,
                            width: 100,
                            height: 50,
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
        ),
      ),
    );
  }
}
