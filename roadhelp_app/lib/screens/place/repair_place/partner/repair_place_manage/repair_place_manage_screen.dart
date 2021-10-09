import 'package:flutter/material.dart';

import 'components/body.dart';

class RepairPlaceManageScreen extends StatelessWidget {
  static String routeName = "/repair_place_manage";

  const RepairPlaceManageScreen({Key? key}) : super(key: key);

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
