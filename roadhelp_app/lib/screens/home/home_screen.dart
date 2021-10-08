import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import '/components/coustom_bottom_nav_bar.dart';
import '../../config/enums.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
