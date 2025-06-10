import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class books extends StatefulWidget {
  const books({super.key});

  @override
  State<books> createState() => _booksState();
}

class _booksState extends State<books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          left: 21.6.sp,
          right: 21.6.sp,
          top: 16.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 18.sp,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Class 1',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp,
                      color: Color(0xff25265f),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.sp,
            ),
            Column(
              children: [
                // bookbox("Hidi", "des"),
                // SizedBox(
                //   height: 30.sp,
                // ),
                // bookbox("Hidi", "des"),
                // SizedBox(
                //   height: 30.sp,
                // ),
                // bookbox("Hidi", "des"),
                // SizedBox(
                //   height: 30.sp,
                // ),
                // bookbox("Hidi", "des"),
                for (int i = 0; i < 4; i++) bookbox("hello", "test"),
              ],
            )
          ],
        ),
      )),
    );
  }
}

Widget bookbox(String title, String des) {
  return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15.sp),
      width: 350.sp,
      height: 120.sp,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(12.sp, 0, 0, 0)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90.sp,
                width: 90.sp,
                // color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.sp),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/apple.png",
                      width: 80.sp,
                      height: 80.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 230.sp,
            // color: Colors.yellow,
            padding: EdgeInsets.fromLTRB(15.sp, 15.sp, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  des,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                Container(
                  width: 210.sp,
                  // color: Colors.orange,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      button(100.sp, "Download", () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ClassRecord(),
                        //   ),
                        // );
                        // _showToast();
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          color: Color.fromARGB(255, 161, 167, 196)));
}

Widget button(double width, String title, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 30.h,
      width: width.h,
      decoration: BoxDecoration(
        color: Color(0xff25265f),
        // boxShadow: [BoxShadow()],
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(width: 1.sp),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            // fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
