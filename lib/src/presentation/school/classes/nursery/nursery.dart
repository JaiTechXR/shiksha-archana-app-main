import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/src/presentation/school/classes/nursery/phonetic_sound.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Nursery extends StatefulWidget {
  const Nursery({super.key});

  @override
  State<Nursery> createState() => _NurseryState();
}

class _NurseryState extends State<Nursery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 23.w,
          right: 23.w,
        ),
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
                    'Nursery',
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
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneticSound(),
                ),
              );
            },
            child: Container(
              height: 223.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  24.sp,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/nursery.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(children: [
                Positioned(
                  top: 46.h,
                  left: 16.w,
                  child: Text(
                    "Listen \nPhonetic \nSounds",
                    style: TextStyle(
                      color: Color(0xfffce3e7),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ]),
            ),

            // document
          ),

          //document section
          SizedBox(
            height: 14.h,
          ),
          // boxFile(
          //     "ABC book.doc",
          //     "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/word.png"),
          // SizedBox(
          //   height: 14.h,
          // ),
          // boxFile(
          //     "ABC book.ppt",
          //     "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/ppt.png"),
          // SizedBox(
          //   height: 14.h,
          // ),
          // boxFile(
          //     "ABC book.xls",
          //     "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/excel.png"),
          // SizedBox(
          //   height: 14.h,
          // ),
          // boxFile(
          //     "ABC book.pdf",
          //     "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/pdf.png"),
        ]),
      ),
    ));
  }

  Widget boxFile(String title, String content, String image) {
    return Container(
      padding: EdgeInsets.all(13.sp),
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.sp),
        color: Color.fromARGB(255, 237, 237, 237),
      ),
      child: Row(children: [
        Container(
          height: 72.h,
          width: 75.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(11.sp),
              color: Colors.white),
        ),
        Container(
          width: 230.w,
          padding: EdgeInsets.only(
            left: 9.w,
            right: 9.w,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff25265f),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              content,
              style: TextStyle(
                color: Color(0xff636363),
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 22.h,
                width: 99.w,
                decoration: BoxDecoration(
                  color: Color(
                    0xff25265f,
                  ),
                  borderRadius: BorderRadius.circular(
                    4.sp,
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 10.sp,
                  ),
                  Text(
                    "Download",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ]),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
