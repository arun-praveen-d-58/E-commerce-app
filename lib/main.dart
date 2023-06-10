

import 'package:amazon_clone/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';

import 'package:amazon_clone/features/home/screens/home_screen.dart';

import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:provider/provider.dart';

import 'common/bottom_bar.dart';
import 'features/admin/screens/admin_screen.dart';

void main() => runApp(MultiProvider(providers:[
  ChangeNotifierProvider(create: (context)=> UserProvider(),)
],child: MyApp()));

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final AuthService authService = AuthService();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Amazon_Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,

        ),
      ),),
      onGenerateRoute: (settings)=> generateRoute(settings),
    /*  home: new Scaffold(
        appBar: AppBar(title: Text('Hello')),
        body: Column(
          children: [
            Center(
              child: Text('Flutter Demo Clicker Counter Home Page'),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  child: Text('click'),
                );
              }
            ),
          ],
        ),
      ),*/
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar()
          : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
