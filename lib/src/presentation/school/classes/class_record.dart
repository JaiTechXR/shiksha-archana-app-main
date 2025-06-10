import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassRecord extends StatefulWidget {
  const ClassRecord({super.key});

  @override
  State<ClassRecord> createState() => _ClassRecordState();
}

class _ClassRecordState extends State<ClassRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Coming soon",
          style: TextStyle(
            fontSize: 33.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff25265f),
          ),
        ),
      ),
    );
  }
}
