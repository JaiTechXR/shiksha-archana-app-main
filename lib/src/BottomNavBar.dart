import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/teacher_school.dart';
import 'package:shikshaarchana/src/presentation/profile/profilescreen.dart';
import 'package:shikshaarchana/src/presentation/school/class.dart';

import '../Applocalization/Apptranslation.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  final String num;

  const BottomNavBar({super.key, required this.index, required this.num});

  @override
  BottomNavBarState createState() => BottomNavBarState(index: index);
}

class BottomNavBarState extends State<BottomNavBar> {
  static int currentIndex = 0;
  final int index;

  BottomNavBarState({required this.index});
  final PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyList = [
      //dashboard(no: widget.num),
      ClassSection(number: widget.num),
      TeacherSchool(number: widget.num),
      profile(number: widget.num),
    ];

    return SafeArea(
      child: PersistentTabView(
        context,
        controller: controller,
        screens: bodyList,
        items: _navBarsItems(context),
        navBarHeight: 60,
        backgroundColor: Colors.white,
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Color.fromARGB(255, 194, 194, 194),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        navBarStyle: NavBarStyle.style3,
        onItemSelected: (index) {
          if (controller.index == index) {
            // implement your pop-to-root or refresh logic here
          }
        },
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home_rounded),
      title: LanguageTranslation.of(context)!.value("Home"),
      activeColorPrimary: Color(0xff25265f),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.school),
      title: LanguageTranslation.of(context)!.value("Profile"),
      activeColorPrimary: Color(0xff25265f),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.location_solid),
      title: LanguageTranslation.of(context)!.value("Home"),
      activeColorPrimary: Color(0xff25265f),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: LanguageTranslation.of(context)!.value("Home"),
      activeColorPrimary: Color(0xff25265f),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
