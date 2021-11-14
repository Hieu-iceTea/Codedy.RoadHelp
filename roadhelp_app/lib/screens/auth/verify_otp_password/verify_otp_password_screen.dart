import 'package:roadhelp/config/size_config.dart';

import 'components/body.dart';
import 'package:flutter/material.dart';

class VerifyOtpPasswordScreen extends StatelessWidget {
  static String routeName = "/verifyotppassword";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final VerityOtpArguments arguments =
    ModalRoute.of(context)!.settings.arguments as VerityOtpArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Xác minh OTP"),
      ),
      body: Body(
        to: arguments.to,
        onSubmit: arguments.onSubmit,
        onResend: arguments.onResend,
      ),
    );
  }
}

class VerityOtpArguments {
  String to;
  Function(String) onSubmit;
  Function() onResend;

  VerityOtpArguments({
    required this.to,
    required this.onSubmit,
    required this.onResend,
  });
}