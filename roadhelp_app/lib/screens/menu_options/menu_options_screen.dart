import 'package:flutter/material.dart';

import '/components/coustom_bottom_nav_bar.dart';
import '../../config/enums.dart';
import 'components/body.dart';

class MenuOptionsScreen extends StatelessWidget {
  static String routeName = "/menu_options";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
