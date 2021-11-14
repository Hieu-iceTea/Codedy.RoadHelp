import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routeName = "/reset_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt Lại Mật Khẩu"),
      ),
      body: Body(),
    );
  }
}
