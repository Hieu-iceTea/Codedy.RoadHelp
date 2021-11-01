import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';

import 'components/body.dart';

class SendRescueScreen extends StatelessWidget {
  static String routeName = "/send_emergency_rescue";

  const SendRescueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gọi cứu hộ khẩn",
          //style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
