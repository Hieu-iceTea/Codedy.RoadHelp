import 'package:flutter/material.dart';

import 'components/body.dart';

class ReceiveRescueScreen extends StatelessWidget {
  static String routeName = "/route_name";

  const ReceiveRescueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title - Change me now"),
      ),
      body: Body(),
    );
  }
}
