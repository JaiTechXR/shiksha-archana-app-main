import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../Constant/Constants.dart';

class ABC extends StatefulWidget {
  const ABC({super.key});

  @override
  State<ABC> createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  var ModuleData;
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    getModule();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModuleData == null
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'English Phonetic Sounds',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Color(0xff25265f),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 31.h),

            // Apple Container
            Container(
              height: 202.h,
              width: double.infinity,
              color: Color(0xff25265f),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            customText("A", 119),
                            SizedBox(width: 34.w),
                            customText("a", 64),
                          ],
                        ),
                        customText("Apple", 41),
                      ],
                    ),
                    Container(
                      height: 125.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/apple.png"),
                        ),
                      ),
                    )
                  ]),
            ),

            SizedBox(height: 25.h),

            // Image Container
            Container(
              height: 228.h,
              width: 345.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.sp),
                image: DecorationImage(
                  image: AssetImage("assets/images/apple_video.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 13.h),

            // Play Button
            InkWell(
              onTap: () async {
                try {
                  await player.stop();
                  await player
                      .play(UrlSource(
                      Constant.driveUrl + ModuleData[0]['audio']))
                      .then((_) => Fluttertoast.showToast(
                    msg: "Playing: \"apple\"",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff25265f),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  ));
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: "Audio play failed!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              child: Container(
                height: 48.h,
                width: 128.w,
                padding: EdgeInsets.symmetric(
                    vertical: 4.sp, horizontal: 17.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.sp),
                  color: Color(0xff25265f),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText("Play", 28),
                      Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customText(String title, double size) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Future<void> getModule() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('module').get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    setState(() {
      ModuleData = allData;
    });
  }
}
