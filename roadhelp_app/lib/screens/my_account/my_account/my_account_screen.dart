import 'package:flutter/material.dart';
import 'package:roadhelp/components/coustom_bottom_nav_bar.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/screens/my_account/edit_my_account/edit_my_account_screen.dart';

import 'components/body.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = "/my_account";

  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, EditMyAccount.routeName),
            icon: Icon(Icons.edit),
            tooltip: "Edit my account",
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
