import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherDetail extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String address;
  final String img;
  final String bio;
  final List<dynamic> qualification;
  final Map<dynamic, dynamic> experience;

  TeacherDetail({
    super.key,
    required this.name,
    required this.email,
    required this.city,
    required this.address,
    required this.phone,
    required this.img,
    required this.bio,
    required this.qualification,
    required this.experience,
  });

  @override
  State<TeacherDetail> createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          left: 23.0.w,
          right: 23.0.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
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
                      'Teacher Details',
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
              height: 40.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 125.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(
                    10.sp,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        titleText(widget.name),
                        contentText(
                          widget.bio,
                        )
                      ]),
                )),
                Column(
                  children: [
                    Container(
                      height: 106.h,
                      width: 106.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.img), fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 228, 230, 244),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Container(
                    //   height: 15.h,
                    //   width: 76.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(3.sp),
                    //     color: const Color(0xff25265f),
                    //   ),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Edit Profile",
                    //       style: TextStyle(
                    //         fontSize: 9.5.sp,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),

            //
            // Experience section

            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  titleText("Experience"),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 1;
                              i <= (widget.experience.length) / 2;
                              i++)
                            experienceDesign(
                                widget.experience["title$i"].toString(),
                                widget.experience["description$i"].toString()),

                          // contentText(
                          //     widget.experience["title$i"].toString()),
                          // contentText(
                          //     "Special education expert\nPrivate practice in Ghansoli, Navi Mumbai."),
                          // contentText(
                          //     "Special education expert\nPrivate practice in Ghansoli, Navi Mumbai."),
                          // contentText(
                          //     "Special education expert\nPrivate practice in Ghansoli, Navi Mumbai."),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            // Qualification
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  titleText("Qualification"),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon(I),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // contentText(widget.qualification.toString()),
                          for (int i = 0; i < widget.qualification.length; i++)
                            boxDesign(widget.qualification[i].toString()),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            // Personal Details
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  titleText("Personal Details"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon(I),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          contentText("Email: ${widget.email}"),
                          SizedBox(
                            height: 7.h,
                          ),
                          contentText("Phone Number: +91-${widget.phone}"),
                          SizedBox(
                            height: 7.h,
                          ),
                          contentText("City: ${widget.city}, India"),
                          SizedBox(
                            height: 7.h,
                          ),
                          Container(
                            width: 300.w,
                            child: contentText(
                              "Address: ${widget.address}",
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xff25265f),
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
    );
  }

  Widget boxDesign(String title) {
    return Container(
      // color: Colors.red,
      height: 33.h,
      width: 310.w,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xff25265f),
                height: 11.h,
                width: 3.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 11.h,
                width: 11.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff25265f),
                ),
              ),
              Container(
                color: Color(0xff25265f),
                height: 11.h,
                width: 3.w,
              ),
            ],
          ),
          SizedBox(
            width: 7.w,
          ),
          contentText(title),
        ],
      ),
    );
  }

  Widget experienceDesign(String title, String description) {
    return Container(
      // color: Colors.red,
      height: 35.h,
      width: 310.w,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xff25265f),
                height: 12.h,
                width: 3.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 11.h,
                width: 11.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff25265f),
                ),
              ),
              Container(
                color: Color(0xff25265f),
                height: 12.h,
                width: 3.w,
              ),
            ],
          ),
          SizedBox(
            width: 7.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentText(title),
              contentText(description),
            ],
          )
        ],
      ),
    );
  }

  Widget contentText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color.fromARGB(255, 56, 56, 56),
        fontWeight: FontWeight.w400,
        fontSize: 13.07.sp,
      ),
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
    );
  }
}
