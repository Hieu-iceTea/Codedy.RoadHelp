import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final OtpArguments arguments =
        ModalRoute.of(context)!.settings.arguments as OtpArguments;

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

class OtpArguments {
  String to;
  Function(String) onSubmit;
  Function() onResend;

  OtpArguments({
    required this.to,
    required this.onSubmit,
    required this.onResend,
  });
}
