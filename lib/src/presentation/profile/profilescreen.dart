// import 'dart:html';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/Applocalization/Apptranslation.dart';
import 'package:shikshaarchana/src/presentation/onboarding/edit_profile.dart';

import '../../../Constant/Constants.dart';
import '../../../preferences.dart';
import '../onboarding/onboardingscreen.dart';
import '../splashscreen/splashscreen.dart';

class profile extends StatefulWidget {
  final String number;
  const profile({super.key, required this.number});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
 final FirebaseAuth auth = FirebaseAuth.instance;
  late String languageSelected;
  int _selectedIndex = 1;
  int enButtonColor = 0;

  int hiButtonColor = 0;

  int nextButtonColor = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _getUserName(widget.number);
    // TODO: implement initState
    super.initState();
  }

  var UserData;
  @override
  Widget build(BuildContext context) {
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: UserData == null
                ? Container(
                  
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: Color(0xff25265f),
                                  ),
                  ),)
                : Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   height: 19.h,
                            //   width: 8.w,
                            //   child: Icon(
                            //     Icons.arrow_back,
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 60.w,
                            // ),
                            Container(
                              height: 19.h,
                              // width: 296.w,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        // color: Colors.yellow,
                        height: 225.h,
                        width: 356.w,
                        // padding: EdgeInsets.only(left: 17.sp, right: 17.sp),
                        child: Column(children: [
                          Container(
                            height: 121.h,
                            width: 121.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.sp),
                                image: DecorationImage(
                                  image: MemoryImage(
                                    Base64Decoder().convert(UserData['image']),
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            height: 70.h,
                            width: double.infinity,
                            // color: Colors.blue,
                            child: Column(children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${UserData['name']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                  ),
                                  Text(
                                    'New Delhi, India',
                                    style: TextStyle(
                                        fontSize: 11.8.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 17.sp),
                            child: InkWell(
                              onTap: () {
                                

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(
                                      image: UserData['image'],
                                      id: UserData['id'],
                                      number: UserData['phonenumber'],
                                      clas: UserData['classes'],
                                      dob: UserData['dateofbirth'],
                                      email: UserData['email'],
                                      fatehrName: UserData['fathername'],
                                      motherName: UserData['mothername'],
                                      gender: UserData['gender'],
                                      name: UserData['name'],
                                      school: UserData['schoolname'],
                                      typeOfDisab: UserData['disability'],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Color(0xff272727),
                                      size: 21.sp,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Edit Bio',
                                      style: TextStyle(
                                          fontSize: 15.8.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                            ),
                          )
                        ]),
                      ),
                      detailBox("Full Name", UserData['name']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Email ID", UserData['email']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Contact Number", UserData['phonenumber']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Gender", UserData['gender']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("School Name", UserData['schoolname']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Class", UserData['classes']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Father's Name", UserData['fathername']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Mother's Name", UserData['mothername']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Type of Disability", UserData['disability']),
                      SizedBox(
                        height: 9.h,
                      ),
                      detailBox("Date of Birth", UserData['dateofbirth']),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(23.sp),
                        height: 293.h,
                        width: 332.w,
                        decoration: BoxDecoration(
                          color: Color(0xfff4f6ff),
                          borderRadius: BorderRadius.circular(19.sp),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            endText("Language", () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                      height: 340.h,
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
                                            color: Color(0xff25265f)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Please Choose Language",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
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

                                                onLocaleChange(
                                                    const Locale("en"));

                                                // Navigator.push(context,
                                                //     MaterialPageRoute(builder: (context) => term()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 11.sp,
                                                      vertical: 11.sp),
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 2.0.sp,
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.sp)),
                                                  primary: enButtonColor == 1
                                                      ? Colors.white
                                                      : Color(0xff25265f)),
                                              child: Center(
                                                child: Text(
                                                  "English",
                                                  style: TextStyle(
                                                      color: enButtonColor == 1
                                                          ? Color(0xff25265f)
                                                          : Colors.white,
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

                                                onLocaleChange(
                                                    const Locale("hi"));

                                                // Navigator.push(context,
                                                //     MaterialPageRoute(builder: (context) => term()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 11.sp,
                                                      vertical: 11.sp),
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 2.sp,
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp)),
                                                  primary: hiButtonColor == 1
                                                      ? Colors.white
                                                      : Color(0xff25265f)),
                                              child: Center(
                                                child: Text(
                                                  "हिंदी",
                                                  style: TextStyle(
                                                      color: hiButtonColor == 1
                                                          ? Color(0xff25265f)
                                                          : Colors.white,
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
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          profile(
                                                        number: widget.number,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 46.h,
                                                  width: 99.w,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2.sp,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.sp),
                                                    color: nextButtonColor == 1
                                                        ? Colors.white
                                                        : Color(0xff25265f),
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text("Done",
                                                        style: TextStyle(
                                                          color:
                                                              nextButtonColor == 1
                                                                  ? Color(
                                                                      0xff25265f)
                                                                  : Colors.white,
                                                          fontSize: 19.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },

                                // color is applied to main screen when modal bottom screen is displayed
                                // barrierColor: Colors.greenAccent,
                                //background color for modal bottom screen
                                backgroundColor: Color(0xff25265f),
                                //elevates modal bottom screen
                                // elevation: 10,
                                // gives rounded corner to modal bottom screen
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(62.sp),
                                    topRight: Radius.circular(62.sp),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              height: 3.sp,
                            ),
                            Divider(
                              color: Color(0xffcfcfcf),
                              thickness: 1.6.sp,
                            ),
                            SizedBox(
                              height: 1.sp,
                            ),
                            // endText("Location", () {}),
                            // SizedBox(
                            //   height: 3.sp,
                            // ),
                            // Divider(
                            //   color: Color(0xffcfcfcf),
                            //   thickness: 1.6.sp,
                            // ),
                            // SizedBox(
                            //   height: 1.sp,
                            // ),
                            endText("Help", () {}),
                            SizedBox(
                              height: 3.sp,
                            ),
                            Divider(
                              color: Color(0xffcfcfcf),
                              thickness: 1.6.sp,
                            ),
                            SizedBox(
                              height: 1.sp,
                            ),
                            endText("Notifications", () {}),
                            SizedBox(
                              height: 3.sp,
                            ),
                            Divider(
                              color: Color(0xffcfcfcf),
                              thickness: 1.6.sp,
                            ),
                            SizedBox(
                              height: 1.sp,
                            ),
                            endText("Logout", () {
                              SessionManager().cleanPrefernces();
                  auth.signOut();
                  Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new splash(),),);
                            }),
                            SizedBox(
                              height: 3.sp,
                            ),
                            Divider(
                              color: Color(0xffcfcfcf),
                              thickness: 1.6.sp,
                            ),
                            endText('Terms of Services & privacy Policies',
                                () => null),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  )),
      ),
    );
  }

  Future<void> _getUserName(String no) async {
    await FirebaseFirestore.instance
        .collection('userDetail')
        .where('phonenumber', isEqualTo: no)
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              setState(() {
                print("-------------${document.data()}");
                UserData = document.data();
              });

              //docIDs.add(document.reference.id);
            }));
  }

  Widget detailBox(String title, String data) {
    return Container(
      height: 54.h,
      width: 332.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp), color: Color(0xfff4f6ff)),
      child: Column(children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25.6.w, top: 12.7.h),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Color(0xff25265f),
                  fontSize: 10.9.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25.6.w, top: 5.sp),
              child: Text(
                '$data',
                style: TextStyle(
                  color: Color(0xff25265f),
                  fontSize: 14.9.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ))
      ]),
    );
  }

  Widget endText(String title, Function()? onTap) {
    return Padding(
      padding: EdgeInsets.all(1.sp),
      child: InkWell(
        onTap: onTap,
        child: Text(
          "$title",
          style: TextStyle(
            color: Color(0xff25265f),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      LanguageTranslation.load(locale);
    });
  }
}
