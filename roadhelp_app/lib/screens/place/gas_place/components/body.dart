import 'package:flutter/material.dart';
import 'package:roadhelp/screens/place/gas_place/components/gas_place_item.dart';
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
      itemCount: 10,
      itemBuilder: (ctx, index) => GasPlaceItem(),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
