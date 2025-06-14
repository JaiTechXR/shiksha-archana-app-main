
// import 'package:audioplayers/audio_cache.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../Constant/Constants.dart';

class Module extends StatefulWidget {
  const Module({super.key});

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  var ModuleData;
  AudioPlayer player = AudioPlayer(); // No deprecated PlayerMode
  bool isPlaying = false;

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
    return SafeArea(
        child: Scaffold(
          body: ModuleData == null
              ? Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
            itemCount: ModuleData.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back, size: 40, color: Colors.deepPurpleAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        ModuleData[itemIndex]['letter'],
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                    ModuleData[itemIndex]['image'] == null
                        ? CircularProgressIndicator()
                        : Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        Constant.driveUrl + ModuleData[itemIndex]['image'],
                        height: 220,
                        width: 220,
                        fit: BoxFit.contain,
                        loadingBuilder: (ctx, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff2ecfa),
                        border: Border.all(color: Color(0xff9e9e9e)),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          ModuleData[itemIndex]['name'],
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 26),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Color(0xffefefef)),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          ModuleData[itemIndex]['desc'],
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          await player.stop(); // Stop previous audio
                          String audioUrl = Constant.driveUrl + ModuleData[itemIndex]['audio'];
                          await player.play(UrlSource(audioUrl));
                        },
                        child: const Icon(Icons.play_circle, size: 100, color: Color(0xff25265f)),
                      ),
                    )
                  ],
                ),
            options: CarouselOptions(
              onPageChanged: (int i, CarouselPageChangedReason cr) async {
                await player.stop(); // Stop audio on page change
              },
              autoPlay: false,
              height: MediaQuery.of(context).size.height - 100,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1.0,
              initialPage: 0,
            ),
          ),
        ));
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