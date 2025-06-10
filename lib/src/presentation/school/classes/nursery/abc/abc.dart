import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  AudioPlayer player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;

  @override
  void initState() {
    getModule();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModuleData == null
            ? Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(children: [
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0.w, right: 18.w),
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
                      // SizedBox(
                      //   width: 80.w,
                      // ),
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
                SizedBox(
                  height: 31.h,
                ),

                //Apple contaier part
                Container(
                  height: 202.h,
                  width: double.infinity,
                  color: Color(0xff25265f),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                customText("A", 119),
                                SizedBox(
                                  width: 34.w,
                                ),
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
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 228.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.sp),
                    // border: Border.all()
                    image: const DecorationImage(
                      image: AssetImage("assets/images/apple_video.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),

                //play button
                InkWell(
                  onTap: () async {
                    await player
                        .play(Constant.driveUrl + ModuleData[0]['audio'],
                            isLocal: true)
                        .then((value) => Fluttertoast.showToast(
                            msg: "Playing: \"apple\"",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Color(0xff25265f),
                            textColor: Colors.white,
                            fontSize: 16.0));
                  },
                  child: Container(
                    height: 48.h,
                    width: 128.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.sp, horizontal: 17.w),
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
                )
              ]),
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

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    setState(() {
      ModuleData = allData;
    });
    // await FirebaseFirestore.instance
    //     .collection('module')
    //     .get()
    //     .then((snapshot) =>
    //     snapshot.docs.forEach((document) {
    //       setState(() {
    //         print("-------------${document.data()}");
    //         // UserData =  document.data();
    //       });
    //
    //       //docIDs.add(document.reference.id);
    //     }));
  }
}
