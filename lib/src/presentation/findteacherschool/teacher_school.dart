import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'findschool/school.dart';
import 'findteacher/teacher.dart';

class TeacherSchool extends StatefulWidget {
  String number;
  TeacherSchool({super.key, required this.number});

  @override
  State<TeacherSchool> createState() => _TeacherSchoolState();
}

class _TeacherSchoolState extends State<TeacherSchool> {
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
      body: SafeArea(
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
              height: 20.h,
            ),
            // teacher container
            box("Find nearby teacher", "assets/images/teacher.png", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherScreen()));
            }),
            SizedBox(
              height: 14.h,
            ),
            box("Find nearby school", "assets/images/school.png", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SchoolScreen()));
            }),
            // school container
          ],
        ),
      )),
    );
  }

  Widget box(String title, String img, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 354.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.sp),
          color: Color(0xff25265f),
        ),
        child: Column(children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 207.h,
            width: 224.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(19.sp),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 49.h,
            width: 283.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.sp), color: Colors.white),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
        ]),
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
}
