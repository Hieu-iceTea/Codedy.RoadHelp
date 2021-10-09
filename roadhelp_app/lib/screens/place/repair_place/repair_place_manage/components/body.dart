import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage/components/repair_place_item.dart';

import '/config/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      itemCount: demoGarages.length,
      itemBuilder: (ctx, index) => RepairPlaceItem(
        garage: demoGarages[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
