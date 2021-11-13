import 'package:flutter/material.dart';

import 'components/body.dart';

class UserRequestBecomePartnerScreen extends StatelessWidget {
  static String routeName = "/user_request_become_partner";

  const UserRequestBecomePartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Yêu cầu trở thành đối tác",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
