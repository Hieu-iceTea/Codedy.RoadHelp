import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(issue: arguments.issue),
    );
  }
}

class ReceiveRescueDetailsArguments {
  final Issues issue;

  ReceiveRescueDetailsArguments({required this.issue});
}
