import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';

import 'components/body.dart';

class IssueDetailsScreen extends StatelessWidget {
  static String routeName = "/issue_details";

  const IssueDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final IssueDetailsArguments arguments = ModalRoute.of(context)!
        .settings
        .arguments as IssueDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(issue: arguments.issue),
    );
  }
}

class IssueDetailsArguments {
  final Issues issue;

  IssueDetailsArguments({required this.issue});
}
