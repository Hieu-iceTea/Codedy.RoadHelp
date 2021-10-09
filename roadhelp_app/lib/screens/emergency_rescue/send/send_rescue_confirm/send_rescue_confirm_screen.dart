import 'package:flutter/material.dart';
import 'package:roadhelp/components/coustom_bottom_nav_bar.dart';
import 'package:roadhelp/config/enums.dart';

import 'components/body.dart';

class SendRescueConfirmScreen extends StatelessWidget {
  static String routeName = "/send_emergency_rescue/confirmation";

  const SendRescueConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title - Change me now"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
