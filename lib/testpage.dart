import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              Container(
                width: 22,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "May",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 20,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                    ),
                  ),
                  Expanded(child: Center(child: const Text("Hello"))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 20,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
