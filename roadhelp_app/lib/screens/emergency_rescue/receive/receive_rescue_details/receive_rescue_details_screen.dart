import 'package:flutter/material.dart';
import 'package:roadhelp/components/coustom_bottom_nav_bar.dart';
import 'package:roadhelp/config/enums.dart';

import 'components/body.dart';

class ReceiveRescueDetailsScreen extends StatelessWidget {
  static String routeName = "/send_emergency_rescue";

  const ReceiveRescueDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive rescue"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
