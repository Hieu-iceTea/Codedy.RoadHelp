import 'package:flutter/material.dart';

import 'components/body.dart';

class EditMyAccountSuccess extends StatelessWidget {
  static String routeName = "/edit_my_account_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Edit My Account Success"),
      ),
      body: Body(),
    );
  }
}
