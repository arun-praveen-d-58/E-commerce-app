import 'package:flutter/material.dart';

import 'features/auth/screens/auth_screens.dart';
import 'features/home/screens/home_screen.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(settings: routeSettings,
      builder: (context)=> const AuthScreen(),);

      case HomeScreen.routeName:
      return MaterialPageRoute(settings: routeSettings,
      builder: (context)=> const HomeScreen(),);

    default:
      return MaterialPageRoute(settings: routeSettings,
        builder: (context)=> const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),);
          throw '';

  }
}