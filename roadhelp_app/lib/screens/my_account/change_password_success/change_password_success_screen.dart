import 'package:flutter/material.dart';

import 'components/body.dart';

class ChangePasswordSuccessScreen extends StatelessWidget {
  static String routeName = "/change_password_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Change Password Success"),
      ),
      body: Body(),
    );
  }
}
