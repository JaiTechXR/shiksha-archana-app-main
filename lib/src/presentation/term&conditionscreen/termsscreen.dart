import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../term&conditionscreen/termAndConditions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/src/presentation/login/loginscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../onboarding/onboardingscreen.dart';

class term extends StatefulWidget {
  const term({super.key});

  @override
  State<term> createState() => _termState();
}

class _termState extends State<term> {
  var isLoading = true;
  bool? valuefirst = true;
  var containeropacity = 0.0;
  var maincontaineropacity = 1.0;
  bool Check = false;
  @override
  Widget build(BuildContext context) {
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF25265F),
          ),
          Positioned(
            bottom: 0.h,
            child: Container(
              height: 745.h,
              width: 390.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.sp),
                  topRight: Radius.circular(60.sp),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2E2E2E),
                        letterSpacing: 1.8.sp,
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    // TermCondition.termCondition,
                     Container(
                        height: 525.h,
                        width: 330.w,
                        // color: Colors.red,
                        child: SingleChildScrollView(child: TermCondition.termCondition), 
                        
                    //     // Stack(
                    //     //   children: [
                    //     //     TermCondition.termCondition,
                    //     //     // WebView(
                    //     //     //   zoomEnabled: true,
                    //     //     //   initialUrl:
                    //     //     //       "https://edfoal.com/shiksha-archana-app-privacy-policy/",
                    //     //     //   javascriptMode: JavascriptMode.unrestricted,
                    //     //     //   onPageFinished: (finish) {
                    //     //     //     setState(() {
                    //     //     //       isLoading = false;
                    //     //     //     });
                    //     //     //   },
                    //     //     // ),
                    //     //     // isLoading
                    //     //     //     ? Container(
                    //     //     //         height: double.infinity,
                    //     //     //         width: double.infinity,
                    //     //     //         color: Colors.white,
                    //     //     //         child: Center(
                    //     //     //             child: CircularProgressIndicator()),
                    //     //     //       )
                    //     //     // : Stack(),
                    //     //   ],
                    //     // ),
                      ),
                    
                    Divider(
                      endIndent: 19.w,
                      indent: 19.w,
                      color: Color(0xFFCFCFCF),
                      // height: 11.h,
                    ),

                    //bottom bar
                    Container(
                      // color: Colors.black,

                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 19.h, right: 19.h, top: 5.h),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: Check,
                                  onChanged: (value) {
                                    setState(() {
                                      Check = value!;
                                    });
                                  },
                                ),
                                Text(
                                  LanguageTranslation.of(context)!.value(
                                      "I agree with the Terms & Condition"),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 38.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0.w,
                                          color: Color(0xff25265f)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      primary: Colors.white),
                                  child: Text(
                                    LanguageTranslation.of(context)!
                                        .value("Quit"),
                                    style: TextStyle(
                                        color: Color(0xff25265f),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 41.w,
                              ),
                              SizedBox(
                                width: 120.w,
                                height: 38.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Check == true
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => login()))
                                        : print('');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0.w,
                                          color: Check == true
                                              ? Color(0xff25265f)
                                              : Colors.grey),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      primary: Check == true
                                          ? Color(0xff25265f)
                                          : Colors.grey),
                                  child: Text(
                                    LanguageTranslation.of(context)!
                                        .value("Continue"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class term extends StatefulWidget {
  const term({super.key});

  @override
  State<term> createState() => _termState();
}

class _termState extends State<term> {
  var isLoading = true;
  bool? valuefirst = true;
  var containeropacity = 0.0;
  var maincontaineropacity = 1.0;
  bool Check = false;
  @override
  Widget build(BuildContext context) {
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
           color: Colors.red,
            margin: EdgeInsets.fromLTRB(width_varible * 0.05,
                height_variable * 0.05, width_varible * 0.05, 0),
            height: height_variable * 0.68,
            width: width_varible * 0.9,
            child: Column(children: [
              Container(
                child: Column(children: [
                  SizedBox(
                    // height:20,
                    height:height_variable * 0.033,
                  ),
                  Text(
                    LanguageTranslation.of(context)!.value("Term & Conditions"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(37, 38, 95, 10),
                      fontSize: height_variable * 0.03,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: height_variable * 0.01,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Divider(
                        color: Color(0xff25265f),
                        thickness: height_variable * 0.002,
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: height_variable * 0.015,
              // ),
              Container(
                height: height_variable * 0.49,
                // color: Colors.green,
                child: Stack(
                  children: [
                    WebView(
                      zoomEnabled: true,
                      initialUrl:
                          "https://edfoal.com/shiksha-archana-app-privacy-policy/",
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    isLoading
                        ? Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.white,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Stack(),
                  ],
                ),
                // child: Column(children: [
                //   Text(
                //     LanguageTranslation.of(context)!.value("lorem"),
                //     textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: height_variable * 0.015),
                //   )
                // ]),
              ),
              SizedBox(
                height: height_variable * 0.03,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "EdFoal",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height_variable * 0.023,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: height_variable * 0.005),
              // Container(
              //     child: Row(
              //   children: [
              //     Checkbox(
              //       value: this.value,
              //       onChanged: (value) {
              //         setState(() {
              //           if (this.value = value!) {
              //             containeropacity = 1.0;
              //           } else {
              //             containeropacity = 0.0;
              //           }
              //           // this.value = value!;
              //         });
              //       },
              //     ),
              //     Text(
              //       "I agree with the Terms & Condition",
              //       style: TextStyle(fontSize: height_variable * 0.018),
              //     )
              //   ],
              // ))
            ]),
          ),
          Container(
            height: height_variable * 0.21,

            decoration: BoxDecoration(
             color: Colors.blue,
              border: Border.all(color: Color(0xff25265f)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: Check,
                        onChanged: (value) {
                          setState(() {
                            Check = value!;
                          });
                        },
                      ),
                      Text(
                        LanguageTranslation.of(context)!
                            .value("I agree with the Terms & Condition"),
                        style: TextStyle(fontSize: height_variable * 0.015),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: width_varible * 0.15,
                              vertical: height_variable * 0.001),
                          side:
                              BorderSide(width: 1.0, color: Color(0xff25265f)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: Colors.white),
                      child: Text(
                        LanguageTranslation.of(context)!.value("Quit"),
                        style: TextStyle(
                            color: Color(0xff25265f),
                            fontSize: height_variable * 0.015,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: width_varible * 0.05,
                    ),
                    Container(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                          Check == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()))
                              : print('');
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: width_varible * 0.1,
                                vertical: height_variable * 0.001),
                            side: BorderSide(
                                width: 1.0,
                                color: Check == true
                                    ? Color(0xff25265f)
                                    : Colors.grey),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            primary: Check == true
                                ? Color(0xff25265f)
                                : Colors.grey),
                        child: Text(
                          LanguageTranslation.of(context)!.value("Continue"),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height_variable * 0.015,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          // AnimatedOpacity(
          //   opacity: maincontaineropacity,
          //   duration: Duration(seconds: 1),
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(width_varible * 0.05,
          //         height_variable * 0.015, width_varible * 0.05, 0),
          //     width: width_varible * 0.9,
          //     height: height_variable * 0.2,
          //     child: Column(
          //       children: [
          //         Container(
          //             child: Row(
          //           children: [
          //             Checkbox(
          //               value: this.value,
          //               onChanged: (value) {
          //                 setState(() {
          //                   if (this.value = value!) {
          //                     containeropacity = 1.0;
          //                   } else {
          //                     containeropacity = 0.0;
          //                   }
          //                   // this.value = value!;
          //                 });
          //               },
          //             ),
          //             Text(
          //               "I agree with the Terms & Condition",
          //               style: TextStyle(fontSize: height_variable * 0.018),
          //             )
          //           ],
          //         )),
          //         // Container(
          //         //   child: Row(
          //         //     children: [
          //         //       Checkbox(
          //         //           checkColor: Colors.green,
          //         //           activeColor: Colors.red,
          //         //           value: this.valuefirst,
          //         //           onChanged: (bool? value) {
          //         //             // setState(() {
          //         //             //   valuefirst = value;
          //         //             // });
          //         //           }),
          //         //     ],
          //         //   ),
          //         // ),
          //         SizedBox(
          //           height: height_variable * 0.05,
          //         ),
          //         // sized
          //         AnimatedOpacity(
          //           opacity: containeropacity,
          //           duration: Duration(seconds: 1),
          //           child: Container(
          //             margin: EdgeInsets.fromLTRB(
          //                 width_varible * 0.03, 0, width_varible * 0.03, 0),

          //           ),
          //         )
          //       ],
          //     ),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //           width: width_varible * 0.005,
          //           color: Colors.black,
          //         ),
          //         borderRadius: BorderRadius.all(Radius.circular(10))),
          //   ),
          // ),
        ],
      )),
    );
  }
}
*/
