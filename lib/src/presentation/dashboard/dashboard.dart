import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/module.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../splashscreen/splashscreen.dart';

class dashboard extends StatefulWidget {
  final String no;
  const dashboard({super.key,required this.no, required PersistentTabController controller});

  @override
  State<dashboard> createState() => _dashboardState();
}
final FirebaseAuth auth = FirebaseAuth.instance;

class _dashboardState extends State<dashboard> {
  List<String> docIDs = [];


  int _selectedIndex = 0;

  // int currentindex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var UserData;

  @override
  void initState() {
    //getDocId();
    _getUserName(widget.no);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightVariable = MediaQuery
        .of(context)
        .size
        .height;
    double widthVarible = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LanguageTranslation.of(context)!.value("Shiksha Archana"),
              style: const TextStyle(color: Colors.white),
            ),
            GestureDetector(
                onTap: () {
                  SessionManager().cleanPrefernces();
                  auth.signOut();
                  Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => splash()));

                  // RestartWidget.restartApp(context);
                },
                child: Icon(Icons.logout, color: Colors.white, size: 25,))
          ],
        ),
        automaticallyImplyLeading: false,
        // titleSpacing: 00.0,
        centerTitle: true,
        // toolbarHeight: 60.2,
        // toolbarOpacity: 0.8,

        // elevation: 0.00,
        backgroundColor: Color.fromRGBO(37, 38, 95, 10),
        // actions: [
        //   Icon(
        //     Icons.more_vert,
        //     size: 35,
        //   ),
        // ],
      ),
      // drawer: A,
      body: SingleChildScrollView(
        child:
        UserData==null?
        Align(
            alignment: Alignment.center,
            child: const CircularProgressIndicator()):
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  widthVarible * 0.1,
                  heightVariable * 0.05,
                  widthVarible * 0.1,
                  heightVariable * 0.03),
              child: Row(children: [
                Text(
                  "Hi",
                  style: TextStyle(fontSize: heightVariable * 0.03,color: Color(0xff646464)),
                ),
                SizedBox(
                  width: widthVarible * 0.02,
                ),
                Text(
                  UserData['firstname'],
                  style: TextStyle(fontSize: heightVariable * 0.03,color: Color(0xff646464)),
                ),
                SizedBox(
                  width: widthVarible * 0.03,
                ),
                Text(
                  "!!",
                  style: TextStyle(fontSize: heightVariable * 0.03,color: Color(0xff646464)),
                )
              ]),
            ),
            Divider(
              color: Color(0xfff4f4f4),
              thickness: heightVariable * 0.002,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(widthVarible * 0.07,
                  heightVariable * 0.03, widthVarible * 0.07, 0),
              child: Row(children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Module()));

                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: heightVariable * 0.002),
                      padding: EdgeInsets.all(16),
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: width_varible * 0.15,
                      //     vertical: height_variable * 0.04),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(
                            LanguageTranslation.of(context)!.value("A"),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: heightVariable * 0.05,
                            ),
                          ),
                          Text(
                            LanguageTranslation.of(context)!.value("Bc"),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: heightVariable * 0.03,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        LanguageTranslation.of(context)!.value("Phonetic Sounds"),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),),
                SizedBox(
                  width: heightVariable * 0.014,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => test()));
                //     },
                //     style: ElevatedButton.styleFrom(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: width_varible * 0.2,
                //             vertical: height_variable * 0.065),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0)),
                //         primary: Color.fromARGB(246, 204, 204, 211)),
                //     child: Column(
                //       children: [
                //         Container(
                //           child: Row(
                //             children: [
                //               // Text(
                //               //   "A",
                //               //   style: TextStyle(
                //               //     color: Colors.black,
                //               //     fontSize: 40,
                //               //   ),
                //               // ),
                //               // Text(
                //               //   "Bc",
                //               //   style: TextStyle(
                //               //     color: Colors.black,
                //               //     fontSize: 24,
                //               //   ),
                //               // ),
                //             ],
                //           ),
                //         ),
                //         // Container(
                //         //   child: Text("Phonetic Sound"),
                //         // )
                //       ],
                //     )),
              ]),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(width_varible * 0.07,
            //       height_variable * 0.03, width_varible * 0.07, 0),
            //   child: Row(children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => language()));
            //         },
            //         style: ElevatedButton.styleFrom(
            //           // side: BorderSide(width: 1.5),
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width_varible * 0.2,
            //                 vertical: height_variable * 0.065),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             primary: Color.fromARGB(246, 204, 204, 211)),
            //         child: Column(
            //           children: [
            //             Container(
            //               child: Row(
            //                 children: [
            //                   // Text(
            //                   //   "A",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 40,
            //                   //   ),
            //                   // ),
            //                   // Text(
            //                   //   "Bc",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 24,
            //                   //   ),
            //                   // ),
            //                 ],
            //               ),
            //             ),
            //             // Container(
            //             //   child: Text("Phonetic Sound",
            //             //       style: TextStyle(color: Colors.black)),
            //             // )
            //           ],
            //         )),
            //     SizedBox(
            //       width: height_variable * 0.014,
            //     ),
            //     ElevatedButton(
            //         onPressed: () {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => language()));
            //         },
            //         style: ElevatedButton.styleFrom(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width_varible * 0.2,
            //                 vertical: height_variable * 0.065),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             primary: Color.fromARGB(246, 204, 204, 211)),
            //         child: Column(
            //           children: [
            //             Container(
            //               child: Row(
            //                 children: [
            //                   // Text(
            //                   //   "A",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 40,
            //                   //   ),
            //                   // ),
            //                   // Text(
            //                   //   "Bc",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 24,
            //                   //   ),
            //                   // ),
            //                 ],
            //               ),
            //             ),
            //             // Container(
            //             //   child: Text("Phonetic Sound"),
            //             // )
            //           ],
            //         )),
            //   ]),
            // ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(width_varible * 0.07,
            //       height_variable * 0.03, width_varible * 0.07, 0),
            //   child: Row(children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => language()));
            //         },
            //         style: ElevatedButton.styleFrom(
            //           // side: BorderSide(width: 1.5),
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width_varible * 0.2,
            //                 vertical: height_variable * 0.065),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             primary: Color.fromARGB(246, 204, 204, 211)),
            //         child: Column(
            //           children: [
            //             Container(
            //               child: Row(
            //                 children: [
            //                   // Text(
            //                   //   "A",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 40,
            //                   //   ),
            //                   // ),
            //                   // Text(
            //                   //   "Bc",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 24,
            //                   //   ),
            //                   // ),
            //                 ],
            //               ),
            //             ),
            //             // Container(
            //             //   child: Text("Phonetic Sound",
            //             //       style: TextStyle(color: Colors.black)),
            //             // )
            //           ],
            //         )),
            //     SizedBox(
            //       width: height_variable * 0.014,
            //     ),
            //     ElevatedButton(
            //         onPressed: () {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => language()));
            //         },
            //         style: ElevatedButton.styleFrom(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width_varible * 0.2,
            //                 vertical: height_variable * 0.065),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             primary: Color.fromARGB(246, 204, 204, 211)),
            //         child: Column(
            //           children: [
            //             Container(
            //               child: Row(
            //                 children: [
            //                   // Text(
            //                   //   "A",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 40,
            //                   //   ),
            //                   // ),
            //                   // Text(
            //                   //   "Bc",
            //                   //   style: TextStyle(
            //                   //     color: Colors.black,
            //                   //     fontSize: 24,
            //                   //   ),
            //                   // ),
            //                 ],
            //               ),
            //             ),
            //             // Container(
            //             //   child: Text("Phonetic Sound"),
            //             // )
            //           ],
            //         )),
            //   ]),
            // ),
            // IndexedStack(
            //   index: _selectedIndex,
            //   children: [
            //     dashboard(),
            //     profile(),
            //   ],
            // )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     // currentIndex: _selectedIndex,
      //     // onTap: (int newindex) {
      //     //   setState(() {
      //     //     _selectedIndex = newindex;
      //     //   });
      //     // },
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: 'Home',
      //           // title: Text('Home'),
      //           backgroundColor: Color.fromRGBO(37, 38, 95, 10)),
      //       BottomNavigationBarItem(
      //         // onPressed(){}
      //         icon: Icon(Icons.person_2),
      //         label: 'Profile',
      //         // title: Text('Profile'),
      //         backgroundColor: Color.fromRGBO(37, 38, 95, 10),
      //       ),
      //     ],
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.white,
      //
      //     iconSize: height_variable * 0.035,
      //     onTap: _onItemTapped,
      //     elevation: height_variable * 0.003),
    );
  }

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('userDetail').where('phonenumber', isEqualTo: 'no')
        .get()
        .then((snapshot) =>
        snapshot.docs.forEach((document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        }));
  }


  Future<void> _getUserName(String no) async {
    await FirebaseFirestore.instance
        .collection('userDetail').where('phonenumber', isEqualTo: no).limit(1)
        .get()
        .then((snapshot) =>
        snapshot.docs.forEach((document) {
          setState(() {
            print("-------------${document.data()}");
            UserData =  document.data();
          });

          //docIDs.add(document.reference.id);
        }));

  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}