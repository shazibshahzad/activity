import 'package:daily_tip/views/activity.dart';
import 'package:daily_tip/views/login_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) =>  ActivitiesView());
        }
      // case LoginPage.routeName:
      //   {
      //     return MaterialPageRoute(builder: (context) =>  ActivitiesView());
      //   }


    }
  }
}

