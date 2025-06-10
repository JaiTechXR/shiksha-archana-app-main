import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/Constant/Constants.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/BottomNavBar.dart';
import 'package:shikshaarchana/src/presentation/dashboard/dashboard.dart';
import 'package:shikshaarchana/src/presentation/onboarding/onboardingscreen.dart';
import '../languagescreen/languagescreen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(seconds: 5), () {});
    String number = await SessionManager().getString(Constant.userNumber);
    await SessionManager().getString(Constant.isLogin) == 'true'
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavBar(
                      index: 0,
                      num: number,
                    )))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => language()));
  }

  @override
  Widget build(BuildContext context) {
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;

    return Scaffold(
  
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 756.h,
              child: Center(
                child: Column(
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
                        letterSpacing: 1.2.sp,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    Text(
                      "Education For One n All",
                      style: TextStyle(
                        letterSpacing: 1.2.sp,
                        fontSize: 12.42.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/edfoallogo.png",
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 10.38.w,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Technical Partners",
                              style: TextStyle(
                                  color: Color(0xFF484848),
                                  fontSize: 11.54.sp,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "EDFOAL",
                              style: TextStyle(
                                  color: Color(0xFF484848),
                                  fontSize: 12.69.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
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
    );
  }
}
