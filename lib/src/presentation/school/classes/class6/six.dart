import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                    'Class 6',
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
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => PhoneticSound(),
          //       ),
          //     );
          //   },
          //   child: Container(
          //     height: 223.h,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(
          //         24.sp,
          //       ),
          //       image: const DecorationImage(
          //         image: AssetImage(
          //           'assets/images/nursery.png',
          //         ),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     child: Stack(children: [
          //       Positioned(
          //         top: 46.h,
          //         left: 16.w,
          //         child: Text(
          //           "Listen \nPhonetic \nSounds",
          //           style: TextStyle(
          //             color: Color(0xfffce3e7),
          //             fontSize: 22.sp,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       )
          //     ]),
          //   ),

          //   // document
          // ),

          //document section
          SizedBox(
            height: 14.h,
          ),
          // Text("Hindi"),
          boxFile(
              "विज्ञान 1",
              // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
              "assets/classcontent/class4/science46.jpeg"),
          SizedBox(
            height: 14.h,
          ),
          boxFile(
              "विज्ञान 2",
              // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
              "assets/classcontent/class4/class46-2.jpeg"),
          SizedBox(
            height: 14.h,
          ),
          boxFile(
              "विज्ञान 3",
              // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
              "assets/classcontent/class4/science46-3.jpeg"),
          SizedBox(
            height: 14.h,
          ),
          // boxFile(
          //     "ABC book.pdf",
          //     // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/pdf.png"),
        ]),
      ),
    ));
  }

  Widget boxFile(String title, String image) {
    return Container(
      padding: EdgeInsets.all(13.sp),
      // height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.sp),
        color: Color.fromARGB(255, 237, 237, 237),
      ),
      child: Column(children: [
        Container(
          height: 500.h,
          width: 300.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              // fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(11.sp),
            // color: Colors.white
          ),
        ),
        Container(
          width: 230.w,
          padding: EdgeInsets.only(
            left: 12.w,
            right: 9.w,
          ),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xff25265f),
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp),
                ),
                // SizedBox(
                //   height: 3.h,
                // ),
                // Text(
                //   content,
                //   style: TextStyle(
                //     color: Color(0xff636363),
                //     fontSize: 8.sp,
                //     fontWeight: FontWeight.w400,
                //   ),
                //   maxLines: 3,
                //   overflow: TextOverflow.ellipsis,
                // ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  // alignment: Alignment.topRight,
                  child: Container(
                    height: 30.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Color(
                        0xff25265f,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.sp,
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                // _downloadImage();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff25265f),
                              ),
                              child: Text(
                                "Download",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ]),
                  ),
                )
              ]),
        ),
      ]),
    );
  }
}
