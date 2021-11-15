import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import 'components/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routeName = "/reset_password";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final ResetPasswordArgument argument = ModalRoute.of(context)!.settings.arguments as ResetPasswordArgument;

    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt Lại Mật Khẩu"),
      ),
      body: Body(emailTo: argument.emailTo,),
    );
  }
}

class ResetPasswordArgument {
  String emailTo;

  ResetPasswordArgument({
    required this.emailTo,
  });
}