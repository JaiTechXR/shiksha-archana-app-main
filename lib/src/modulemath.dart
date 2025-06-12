import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestoaudio_cache.dartre/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';
import '../Constant/Constants.dart';

class modulemath extends StatefulWidget {
  const modulemath({super.key});

  @override
  State<modulemath> createState() => _modulemathState();
}

class _modulemathState extends State<modulemath> {
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
    return SafeArea(
        child: Scaffold(
      body: ModuleData == null
          ? CircularProgressIndicator()
          : Container(
              child: CarouselSlider.builder(
              itemCount: ModuleData.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.deepPurpleAccent,
                      ),
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
                            loadingBuilder: (BuildContext? ctx, Widget? child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return Image.network(
                                  Constant.driveUrl +
                                      ModuleData[itemIndex]['image'],
                                  height: 220,
                                  width: 220,
                                  fit: BoxFit.contain,
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
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
                        border: Border.all(color: Color(0xff9e9e9e))),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        ModuleData[itemIndex]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 26),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Color(0xffefefef))),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        ModuleData[itemIndex]['desc'],
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18),
                      ),
                    ),
                  ),
                  //  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () async {
                          await player.play(
                              Constant.driveUrl +
                                  ModuleData[itemIndex]['audio'],
                              isLocal: true);

                          //  player.state==AudioPlayerState.STOPPED

                          // audioPlayer.play(Constant.driveUrl+ModuleData[itemIndex]['audio']);
                        },
                        child: const Icon(
                          Icons.play_circle,
                          size: 100,
                          color: Color(0xff25265f),
                        )),
                  )
                ],
              ),
              options: CarouselOptions(
                onPageChanged: (int i, CarouselPageChangedReason cr) {
                  if (player.state == AudioPlayerState.PLAYING) {
                    setState(() {
                      player.stop();
                    });
                  }
                },
                autoPlay: false,
                height: MediaQuery.of(context).size.height - 100,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 1.0,
                initialPage: 0,
              ),
            )),
    ));
  }

  Future<void> getModule() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('module-math').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    setState(() {
      ModuleData = allData;
    });
  }
}
