import 'package:flutter/material.dart';
import 'package:roadhelp/screens/home/home_screen.dart';
import 'package:roadhelp/screens/splash/splash_screen.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'models/issue.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Road Help',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,

      Issue()

    );
  }
}
