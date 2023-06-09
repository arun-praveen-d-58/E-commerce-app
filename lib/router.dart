import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

import 'common/bottom_bar.dart';
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

    case BottomBar.routeName:
      return MaterialPageRoute(settings: routeSettings,
        builder: (context)=> const BottomBar(),);

    case AddProductScreen.routeName:
      return MaterialPageRoute(settings: routeSettings,
        builder: (context)=> const AddProductScreen(),);


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
