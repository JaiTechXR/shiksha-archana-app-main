import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shikshaarchana/Constant/Constants.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/module.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/findschool/school.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/findteacher/teacher.dart';
import 'package:shikshaarchana/src/presentation/languagescreen/languagescreen.dart';
import 'package:shikshaarchana/src/presentation/noticeboard/notice.dart';
import 'package:shikshaarchana/src/presentation/school/class.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class_record.dart';
import 'package:shikshaarchana/src/presentation/school/classes/nursery/nursery.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../../../test.dart';
import '../../BottomNavBar.dart';
import '../profile/profilescreen.dart';
import '../school/classes/nursery/phonetic_sound.dart';
import '../splashscreen/splashscreen.dart';
import '../youtube/youtube.dart';

class dashboard extends StatefulWidget {
  final String no;
  PersistentTabController controller;
  dashboard({super.key, required this.no, required this.controller});

  @override
  State<dashboard> createState() => _dashboardState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _dashboardState extends State<dashboard> {
  @override
  void initState() {
    _getUserName(widget.no);
    _getCurrentPosition();
    // TODO: implement initState
    super.initState();
  }

  //locations
  String? _currentAddress;
  String? _currentCity = "";
  String? _currentCountry = "";
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentCountry = place.country;
        _currentCity = place.subLocality;
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  String name = "";
  List<String> docIDs = [];

  int _selectedIndex = 0;

  // int currentindex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var UserData;

  // @override
  // void initState() {
  //   //getDocId();
  //   _getUserName(widget.no);
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawer: A,
      body: SafeArea(
        child: SingleChildScrollView(
            child: UserData == null
                ? Align(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.only(
                      left: 28.0.w,
                      right: 28.w,
                      top: 25.h,
                      bottom: 4.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Welcome, ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color: Color(0xff8d8d8d),
                              ),
                            ),
                            Text(
                              "$name ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24.sp,
                                color: Color(0xff2e2e2e),
                              ),
                            ),
                            Container(
                              child: Image.asset('assets/images/we.png'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "${_currentCity ?? ""}, ${_currentCountry ?? ""}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff363636),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xff000000),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            // setState(() {
                            //   _selectedIndex = 1;
                            // });
                            widget.controller.jumpToTab(1);
                          },
                          child: Container(
                            height: 124.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.sp),
                                color: Color(0xff5551ff)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 63.h,
                                    width: 121.w,
                                    child: Text(
                                      'What’s your\nSyllabus ?',
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.white,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80.h,
                                    width: 82.5.w,
                                    // color: Colors.white,
                                    child: Stack(children: [
                                      Positioned(
                                        top: 20.h,
                                        left: 20.w,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            // color: Color(0xffff8577),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        left: 10.w,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Color(0xffff8577),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          color: Color(0xfff24e1e),
                                        ),
                                      ),
                                    ]),
                                  )
                                ]),
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),
                        // Find school and teachers part
                        headlines("Find Schools & teachers"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            box("assets/images/teacher.png", () {
                              widget.controller.jumpToTab(2);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => TeacherScreen(),
                              //   ),
                              // );
                            }),
                            box("assets/images/school.png", () {
                              widget.controller.jumpToTab(2);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SchoolScreen(),
                              //   ),
                              // );
                            }),
                          ],
                        ),

                        // listen phonetic sound
                        SizedBox(
                          height: 13.h,
                        ),
                        headlines("Listen Phonetic Sounds"),
                        SizedBox(
                          height: 8.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneticSound()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 30.w),
                            height: 130.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.sp),
                              // border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/phonetic.png"),
                                  fit: BoxFit.cover),
                            ),
                            child: Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 13.h,
                        // ),
                        // headlines("YouTube"),
                        // SizedBox(
                        //   height: 8.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     box("assets/images/youtube.png", () {
                        //       _showToast();
                        //       // widget.controller.jumpToTab(2);
                        //       // Navigator.push(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //     builder: (context) => TeacherScreen(),
                        //       //   ),
                        //       // );
                        //     }),
                        //     // box("assets/images/school.png", () {
                        //     //   widget.controller.jumpToTab(2);
                        //     //   // Navigator.push(
                        //     //   //   context,
                        //     //   //   MaterialPageRoute(
                        //     //   //     builder: (context) => SchoolScreen(),
                        //     //   //   ),
                        //     //   // );
                        //     // }),
                        //   ],
                        // ),

                        // listen phonetic sound
                        SizedBox(
                          height: 13.h,
                        ),
                        headlines("Broadcast & Youtube"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            box("assets/images/noticeboard.png", () {
                              // widget.controller.jumpToTab(2);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => notice(),
                                ),
                              );
                            }),
                            box("assets/images/youtube.png", () {
                              // widget.controller.jumpToTab(2);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => youtube(),
                              //   ),
                              // );
                              _showToast();
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        // headlines("YouTube"),
                        // SizedBox(
                        //   height: 8.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     box("assets/images/youtube.png", () {
                        //       // widget.controller.jumpToTab(2);
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => youtube(),
                        //         ),
                        //       );
                        //     }),
                        //   ],
                        // ),
                        // listen phonetic sound
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )

            //   Column(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.fromLTRB(
            //             width_varible * 0.1,
            //             height_variable * 0.05,
            //             width_varible * 0.1,
            //             height_variable * 0.03),
            //         child: Row(children: [
            //           Text(
            //             "Hi",
            //             style: TextStyle(fontSize: height_variable * 0.03,color: Color(0xff646464)),
            //           ),
            //           SizedBox(
            //             width: width_varible * 0.02,
            //           ),
            //           Text(
            //             UserData['name'],
            //             style: TextStyle(fontSize: height_variable * 0.03,color: Color(0xff646464)),
            //           ),
            //           SizedBox(
            //             width: width_varible * 0.03,
            //           ),
            //           Text(
            //             "!!",
            //             style: TextStyle(fontSize: height_variable * 0.03,color: Color(0xff646464)),
            //           )
            //         ]),
            //       ),
            //       Divider(
            //         color: Color(0xfff4f4f4),
            //         thickness: height_variable * 0.002,
            //       ),
            //       Padding(
            //   padding: EdgeInsets.only(
            //     left: 23.w,
            //     right: 23.w,
            //   ),
            //   child: Column(children: [
            //     // SizedBox(
            //     //   height: 15.h,
            //     // ),

            //     InkWell(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PhoneticSound(),
            //           ),
            //         );
            //       },
            //       child: Container(
            //         height: 223.h,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(
            //             24.sp,
            //           ),
            //           image: const DecorationImage(
            //             image: AssetImage(
            //               'assets/images/nursery.png',
            //             ),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //         child: Stack(children: [
            //           Positioned(
            //             top: 46.h,
            //             left: 16.w,
            //             child: Text(
            //               "Listen \nPhonetic \nSounds",
            //               style: TextStyle(
            //                 color: Color(0xfffce3e7),
            //                 fontSize: 22.sp,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //           )
            //         ]),
            //       ),

            //       // document
            //     ),

            //     //document section
            //     SizedBox(
            //       height: 14.h,
            //     ),

            //   ]),
            // ),
            //     ],
            //   ),
            ),
      ),
    );
  }

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('userDetail')
        .where('phonenumber', isEqualTo: 'no')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
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
                String s = UserData['name'];
                int i = 0;
                while (true) {
                  if (s[i] == " ") {
                    break;
                  }

                  name = name + s[i];
                  if (i == s.length - 1) break;
                  i++;
                }
                setState(() {});
              });

              //docIDs.add(document.reference.id);
            }));
  }

  Widget box(String image, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        height: 154.h,
        width: 154.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          height: 63.h,
          width: 88.w,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  Widget headlines(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

_showToast() => Fluttertoast.showToast(
    msg: "Coming Soon",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 0,
    backgroundColor: Color(0xff25265f),
    textColor: Colors.white,
    fontSize: 16.0);

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
