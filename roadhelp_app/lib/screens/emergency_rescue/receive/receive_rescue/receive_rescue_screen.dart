import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/garage_provider.dart';
import 'package:roadhelp/providers/issue_provider.dart';

import 'components/body.dart';

class ReceiveRescueScreen extends StatelessWidget {
  static String routeName = "/receive_rescue";

  const ReceiveRescueScreen({Key? key}) : super(key: key);

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
            "Nhận cứu hộ khẩn cấp",
            style: TextStyle(color: Colors.black),
          ),
          Consumer<IssueProvider>(
            builder: (context, value, child) => Text(
              "${value.items.length} người đang cần bạn hỗ trợ",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
