import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../term&conditionscreen/termsscreen.dart';
import '../../../preferences.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  var containeropacity = 0.0;

  late String languageSelected;
  int enButtonColor = 0;

  int hiButtonColor = 0;

  int nextButtonColor = 0;

  @override
  Widget build(BuildContext context) {
    // initState(){

    //   setState(() {

    //   });
    // }
    var appLanguage = Provider.of<AppLanguage>(context);

    // double height_variable = MediaQuery.of(context).size.height;
    // double width_varible = MediaQuery.of(context).size.width;
    // double box1_height = height_variable * 0.55;
    // double box2_height = height_variable * 0.45;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF25265F),
          ),
          Positioned(
            top: 200.h,
            child: Container(
              padding: EdgeInsets.only(left: 113.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    height: 122.h,
                    width: 122.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Color(0xFF25265F),
                    ),
                    child: Container(
                      height: 89.h,
                      width: 89.w,
                      decoration: const BoxDecoration(
                        // color: Color(0xFF25265F),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.64.h,
                  ),
                  // siksha archana
                  Text(
                    "Shiksha Archana",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.2.sp,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    "Education For One n All",
                    style: TextStyle(
                      color: Color(0xFFE3E3E3),
                      letterSpacing: 1.2.sp,
                      fontSize: 12.42.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // top: ,

            bottom: 0.h,
            child: Container(
              height: 316.h,
              padding: EdgeInsets.only(
                left: 35.sp,
                right: 35.sp,
                top: 50.sp,
              ),
              width: 390.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.sp),
                    topRight: Radius.circular(55.sp),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please Choose Language",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 22.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        enButtonColor = 1;
                        hiButtonColor = 0;
                        nextButtonColor = 1;

                        languageSelected = "en";
                      });

                      onLocaleChange(const Locale("en"));

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => term()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.sp, vertical: 11.sp),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xff25265f)),
                            borderRadius: BorderRadius.circular(10.0.sp)),
                        backgroundColor: enButtonColor == 1
                            ? Color(0xff25265f)
                            : Colors.white),
                    child: Center(
                      child: Text(
                        "English",
                        style: TextStyle(
                            color: enButtonColor == 1
                                ? Colors.white
                                : Color(0xff25265f),
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hiButtonColor = 1;

                        nextButtonColor = 1;
                        enButtonColor = 0;

                        languageSelected = "hi";
                      });

                      onLocaleChange(const Locale("hi"));

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => term()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.sp, vertical: 11.sp),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xff25265f)),
                            borderRadius: BorderRadius.circular(10.sp)),
                        backgroundColor: hiButtonColor == 1
                            ? Color(0xff25265f)
                            : Colors.white),
                    child: Center(
                      child: Text(
                        "हिंदी",
                        style: TextStyle(
                            color: hiButtonColor == 1
                                ? Colors.white
                                : Color(0xff25265f),
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => term()));
                      },
                      child: Container(
                        height: 46.h,
                        width: 46.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF25265F)),
                          borderRadius: BorderRadius.circular(12.sp),
                          color: nextButtonColor == 1
                              ? Color(0xff25265f)
                              : Colors.white,
                        ),
                        child: Icon(
                          Icons.navigate_next,
                          color: nextButtonColor == 1
                              ? Colors.white
                              : Color(0xff25265f),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      LanguageTranslation.load(locale);
    });
  }
}



//  previous code
/*
Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            
            height: height_variable * 0.55,
            width: width_varible * 1,
            child: Column(
              children: [
                Container(
                  height: box1_height * 0.75,
                  // color: Colors.red,
                ),
                SizedBox(
                  height: box1_height * 0.02,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        " Welcome",
                        style: TextStyle(
                            fontSize: height_variable * 0.05,
                            fontFamily: 'Roboto-Bold',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      width_varible * 0.04, 0, width_varible * 0.45, 0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: height_variable * 0.002,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(children: [
                    Text(
                      "     Let's get started",
                      style: TextStyle(
                          fontSize: height_variable * 0.018,
                          fontFamily: 'Roboto-regular',
                          color: Colors.white),
                    )
                  ]),
                )
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(37, 38, 95, 10),
                image: DecorationImage(
                    image: AssetImage('assets/images/welcomeimage.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width_varible * 0.05,
                height_variable * 0.05, width_varible * 0.05, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please Choose Your language : ",
                  style: TextStyle(fontSize: height_variable * 0.018),
                ),
                SizedBox(
                  height: box2_height * 0.05,
                ),
                ElevatedButton(

                  onPressed: () {
                    onLocaleChange(const Locale("hi"));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => term()));
                  },
                  style: ElevatedButton.styleFrom(

                      padding: EdgeInsets.symmetric(
                          horizontal: width_varible * 0.4,
                          vertical: height_variable * 0.02),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Color(0xff25265f)),
                  child: Center(
                    child: Text(
                      "हिंदी",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height_variable * 0.025),
                    ),
                  ),
                ),
                SizedBox(
                  height: box2_height * 0.03,
                ),
                ElevatedButton(

                  onPressed: () {
                    onLocaleChange(const Locale("en"));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => term()));
                  },
                  style: ElevatedButton.styleFrom(

                      padding: EdgeInsets.symmetric(
                          horizontal: width_varible * 0.2,
                          vertical: height_variable * 0.02),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xff25265f)
                          ),


                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Colors.white),
                  child: Center(
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: Color(0xff25265f),
                          fontSize: height_variable * 0.025),
                    ),
                  ),
                ),
                SizedBox(
                  height: box2_height * 0.05,
                ),

              ],
            ),
          )
        ],
      )),
    );
    */