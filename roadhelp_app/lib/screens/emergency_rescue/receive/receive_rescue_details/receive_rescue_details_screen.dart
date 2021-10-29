import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';

import 'components/body.dart';

class ReceiveRescueDetailsScreen extends StatelessWidget {
  static String routeName = "/receive_rescue_details";

  const ReceiveRescueDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final ReceiveRescueDetailsArguments arguments = ModalRoute.of(context)!
        .settings
        .arguments as ReceiveRescueDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(issue: arguments.issue),
    );
  }
}

class ReceiveRescueDetailsArguments {
  final Issues issue;

  ReceiveRescueDetailsArguments({required this.issue});
}
