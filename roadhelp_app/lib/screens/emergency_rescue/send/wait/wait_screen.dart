import 'package:flutter/material.dart';

import 'components/body.dart';

class WaitScreen extends StatelessWidget {
  static String routeName = "/wait";

  const WaitScreen({Key? key}) : super(key: key);

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
