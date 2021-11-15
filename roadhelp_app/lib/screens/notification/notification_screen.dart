import 'package:flutter/material.dart';
import 'package:roadhelp/models/notification_model.dart';

import 'components/body.dart';


class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Thông báo",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoNotifications.length} mục",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
