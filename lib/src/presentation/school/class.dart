import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class1/first.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class4/four.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class6/six.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class7/seven.dart';
import 'package:shikshaarchana/src/presentation/school/classes/class8/eight.dart';
import 'package:shikshaarchana/src/presentation/school/classes/nursery/nursery.dart';

class ClassSection extends StatefulWidget {
  String number;
  ClassSection({super.key, required this.number});

  @override
  State<ClassSection> createState() => _TeacherSchoolState();
}

class _TeacherSchoolState extends State<ClassSection> {
  @override
  void initState() {
    _getUserName(widget.number);
    _getCurrentPosition();
    // TODO: implement initState
    super.initState();
  }

//accessing current location
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

  var UserData;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          left: 18.0.w,
          right: 18.w,
          top: 25.h,
          bottom: 4.h,
        ),
        child: Column(
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
              height: 0,
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
                Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff000000),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Container(
              height: 35.h,
              width: 195.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(
                  color: const Color(
                    0xff25265f,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Choose Your Class",
                  style: TextStyle(
                    color: Color(0xff25265f),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                    218,
                    "Nursery",
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Nursery(),
                          ),
                        )),
                button(93.76, "LKG", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                })
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(113.76, "UKG", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                }),
                button(93.76, "1", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => first(),
                    ),
                  );
                  // _showToast();
                }),
                button(93.76, "2", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                })
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(113.76, "3", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                }),
                button(93.76, "4", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => four(),
                    ),
                  );
                  _showToast();
                }),
                button(93.76, "5", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  // _showToast();
                })
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(113.76, "6", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => six(),
                    ),
                  );
                  // _showToast();
                }),
                button(93.76, "7", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => seven(),
                    ),
                  );
                  // _showToast();
                }),
                button(93.76, "8", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => eight(),
                    ),
                  );
                  // _showToast();
                })
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(113.76, "9", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                }),
                button(93.76, "10", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                }),
                button(93.76, "11", () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ClassRecord(),
                  //   ),
                  // );
                  _showToast();
                })
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            button(320, "12", () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ClassRecord(),
              //   ),
              // );
              _showToast();
            }),
            SizedBox(
              height: 14.h,
            ),
            button(320, "For Special Child", () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ClassRecord(),
              //   ),
              // );
              _showToast();
            }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
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

  Widget button(double width, String title, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 82.58.h,
        width: width.h,
        decoration: BoxDecoration(
          // boxShadow: [BoxShadow()],
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: Color(0xffcfcfcf), width: 1.sp),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
              color: Color(0xff25265f),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showToast() => Fluttertoast.showToast(
      msg: "Coming Soon",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 0,
      backgroundColor: Color(0xff25265f),
      textColor: Colors.white,
      fontSize: 16.0);
}
