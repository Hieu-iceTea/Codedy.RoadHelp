import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';

import 'components/body.dart';

class RepairPlaceManageImageScreen extends StatelessWidget {
  static String routeName = "/repair_place_manage_image";

  const RepairPlaceManageImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final RepairPlaceManageImageArguments? agrs = ModalRoute.of(context)!
        .settings
        .arguments as RepairPlaceManageImageArguments?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quản lý ảnh",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(garage: agrs!.garage),
    );
  }
}

class RepairPlaceManageImageArguments {
  final Garage garage;

  RepairPlaceManageImageArguments({required this.garage});
}
