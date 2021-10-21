import 'package:flutter/material.dart';

import 'components/body.dart';

class GasPlaceScreen extends StatelessWidget {
  static String routeName = "/route_name";

  const GasPlaceScreen({Key? key}) : super(key: key);

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
            "Cây xăng gần đây nhất",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "10 Cây xăng gần bạn",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
