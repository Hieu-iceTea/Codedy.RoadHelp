import 'package:flutter/material.dart';

import 'config/routes.dart';
import '/screens/splash/splash_screen.dart';
import 'config/theme.dart';
import 'screens/place/repair_place/member/repair_place/repair_place_screen.dart';

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
      initialRoute: RepairPlaceScreen.routeName,
      routes: routes,
    );
  }
}
