import 'package:flutter/material.dart';
import 'package:roadhelp/components/coustom_bottom_nav_bar.dart';
import 'package:roadhelp/config/enums.dart';

import 'components/body.dart';

class EditMyAccount extends StatelessWidget {
  static String routeName = "/edit_my_account";

  const EditMyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit my account"),
      ),
      body: Body(),
    );
  }
}
