import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class youtube extends StatefulWidget {
  const youtube({super.key});

  @override
  State<youtube> createState() => _youtubeState();
}

class _youtubeState extends State<youtube> {
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
                    'Youtube',
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
          boxFiles(
            "Baby Shark",
            // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
            "assets/images/thumbnail.jpg",
            // "Baby Shark is a wildly popular children's song and video featuring a catchy and repetitive tune that has captured the hearts of young audiences worldwide."
          ),
          SizedBox(
            height: 14.h,
          ),
          // boxFile(
          //     "ABC book.ppt",
          //     // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/ppt.png"),
          SizedBox(
            height: 14.h,
          ),
          // boxFile(
          //     "ABC book.xls",
          //     // "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
          //     "assets/images/excel.png"),
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

  Widget boxFiles(
    String title,
    String image,
    // String des
  ) {
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
          height: 200.h,
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
                // Text(
                //   des,
                //   style: TextStyle(
                //       color: Color(0xff25265f),
                //       // fontWeight: FontWeight.w600,
                //       fontSize: 12.sp),
                // ),
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
                                _launchYouTubeLink();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff25265f),
                              ),
                              child: Text(
                                "Play",
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

// Future<void> _downloadImage() async {
//     if (await Permission.storage.request().isGranted) {
//       final String imageUrl = 'URL_OF_THE_IMAGE_TO_DOWNLOAD';

//       final http.Response response = await http.get(Uri.parse(imageUrl));
//       final Directory directory = await getExternalStorageDirectory();
//       final String savePath = directory.path + '/downloaded_image.jpg';

//       final File file = File(savePath);
//       await file.writeAsBytes(response.bodyBytes);

//       print('Image downloaded and saved to: $savePath');
//     } else {
//       print('Storage permission is required to download the image.');
//     }
//   }
  void _launchYouTubeLink() async {
    const String youtubeLink =
        'https://www.youtube.com/watch?v=XqZsoesa55w'; // Replace with your YouTube link
    // ignore: deprecated_member_use
    if (await canLaunch(youtubeLink)) {
      // ignore: deprecated_member_use
      await launch(youtubeLink);
    } else {
      throw 'Could not launch $youtubeLink';
    }
  }

  Widget bookbox(String title, String des) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15.sp),
        width: 350.sp,
        height: 120.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.sp),
            color: Color.fromARGB(255, 161, 167, 196)),
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
                  SizedBox(
                    width: 210.sp,
                    // color: Colors.orange,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // button(100.sp, "Download", () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ClassRecord(),
                        //   ),
                        // );
                        // _showToast();
                        // }
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
