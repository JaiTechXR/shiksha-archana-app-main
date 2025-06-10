
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/teacher_school.dart';
import 'package:shikshaarchana/src/presentation/dashboard/dashboard.dart';
import 'package:shikshaarchana/src/presentation/profile/profilescreen.dart';
import 'package:shikshaarchana/src/presentation/school/class.dart';

import '../Applocalization/Apptranslation.dart';
import 'location/location.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  final String num;

  const BottomNavBar({Key? key, required this.index, required this.num})
      : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState(index: index);
}

class BottomNavBarState extends State<BottomNavBar> {
  static int currentIndex = 0;
  final int index;
  BottomNavBarState({required this.index});
  PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    print(currentIndex);
  }
  

  Widget build(BuildContext context) {
    
    List<Widget> bodyList = [
      dashboard(no: widget.num,controller: controller,),

      ClassSection(number: widget.num),
      TeacherSchool(
        number: widget.num,
      ),
      profile(number: widget.num),
    ];
    return SafeArea(
      child: PersistentTabView(context,
          navBarHeight: 60,
          controller: controller,
          screens: bodyList,
          items: _navBarsItems(context),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                color: const Color.fromARGB(255, 194, 194, 194),
                spreadRadius: 1.sp,
                blurRadius: 2.sp,
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.sp),
              topRight: Radius.circular(16.sp),
            ),
            // colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style12),
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
//
