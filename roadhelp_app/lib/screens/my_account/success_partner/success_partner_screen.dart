import 'package:flutter/material.dart';

import 'components/body.dart';

class PartnerSuccessScreen extends StatelessWidget {
  static String routeName = "/partner_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}