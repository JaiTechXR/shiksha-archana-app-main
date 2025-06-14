import 'package:flutter/material.dart';

import '../../../Applocalization/Apptranslation.dart';

class soon extends StatefulWidget {
  const soon({super.key});

  @override
  State<soon> createState() => _soonState();
}

class _soonState extends State<soon> {
  @override
  Widget build(BuildContext context) {
    double heightVariable = MediaQuery.of(context).size.height;
    double widthVarible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: heightVariable * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LanguageTranslation.of(context)!.value('Hi'),
                style: TextStyle(color: Colors.black),)
              ],
            ),
          ),
        ],
      )),
    );
  }

}
