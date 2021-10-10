import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import 'components/body.dart';

class RepairPlaceManageAddEditScreen extends StatelessWidget {
  static String routeName = "/repair_place_manage_add_edit";

  const RepairPlaceManageAddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm mới / Cập nhật tiệm sửa xe",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}