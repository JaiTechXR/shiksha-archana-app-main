import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                // Container(
                //   child: Image.asset(
                //     "assets/images/logo.png",
                //     width: 100,
                //     height: 100,
                //   ),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shubham"),
                            Text("Shubham"),
                            Text("Kumar"),
                            Text("Noida"),
                            // Text("Noida bhai saheb")
                          ],
                        )
                      ],
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
