import 'package:flutter/material.dart';



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