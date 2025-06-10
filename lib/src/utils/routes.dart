import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shikshaarchana/src/utils/routes_name.dart';

import '../BottomNavBar.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteName.homeScreen:
      //   return MaterialPageRoute(builder: (context) => BottomNavBar(index: ,));
      
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}