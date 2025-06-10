import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notice extends StatefulWidget {
  const notice({super.key});

  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {
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
                      'Broadcast',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Color(0xff25265f),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 16.h,
              ),

              Container(
                padding: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                // child: selectState(),
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Empty...")],
                  ),
                ),
              ),
              //
              //
              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xff636363),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
