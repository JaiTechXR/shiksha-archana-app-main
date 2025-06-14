import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../module.dart";
import "../../../../modulehindi.dart";
import "../../../../modulemath.dart";

class PhoneticSound extends StatefulWidget {
  const PhoneticSound({super.key});

  @override
  State<PhoneticSound> createState() => _PhoneticSoundState();
}

class _PhoneticSoundState extends State<PhoneticSound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
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
              // SizedBox(
              //   width: 80.w,
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Phonetic Sounds',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Color(0xff25265f),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 38.h,
          ),

          // ABC container
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Module(),
                ),
              );
            },
            child: Container(
              height: 200.h,
              width: 317.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  24.sp,
                ),
                border: Border.all(
                  color: Color(0xffcfcfcf),
                  width: 1.sp,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/phonetic_sound1.png",
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 12.h,
          ),
          // 123 contianer
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => modulemath(),
                ),
              );
              // Fluttertoast.showToast(
              //     msg: "Coming Soon",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Color(0xff25265f),
              //     textColor: Colors.white,
              //     fontSize: 16.0);
            },
            child: Container(
              height: 200.h,
              width: 317.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  24.sp,
                ),
                border: Border.all(
                  color: Color(0xffcfcfcf),
                  width: 1.sp,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/phonetic_sound2.png",
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 12.h,
          ),

          // Hindi Phonetic sounds

          InkWell(
            onTap: () {
              // Fluttertoast.showToast(
              //     msg: "Coming Soon",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Color(0xff25265f),
              //     textColor: Colors.white,
              //     fontSize: 16.0);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => modulehindi(),
                ),
              );
            },
            child: Container(
              height: 200.h,
              width: 317.w,
              decoration: BoxDecoration(
                color: Color(0xfffad407),
                borderRadius: BorderRadius.circular(
                  24.sp,
                ),
                border: Border.all(
                  color: Color(0xffcfcfcf),
                  width: 1.sp,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/phonetic_sound3.png",
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 36.w,
                  top: 32.h,
                ),
                child: Text(
                  'Hindi\nPhonetic\nSounds',
                  maxLines: 3,
                  style: TextStyle(
                    height: 1.5.h,
                    color: Color(0xfffae868),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
