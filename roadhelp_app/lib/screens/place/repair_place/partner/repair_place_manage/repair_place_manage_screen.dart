import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/partner/repair_place_manage_add_edit/repair_place_manage_add_edit_screen.dart';

import 'components/body.dart';

class RepairPlaceManageScreen extends StatelessWidget {
  static String routeName = "/repair_place_manage";

  const RepairPlaceManageScreen({Key? key}) : super(key: key);

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
            "Tiệm sửa xe của bạn",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoGarages.length} mục",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(
              context, RepairPlaceManageAddEditScreen.routeName),
          icon: Icon(Icons.add),
          tooltip: "Thêm mới tiệm sửa xe của bạn",
        ),
      ],
    );
  }
}
