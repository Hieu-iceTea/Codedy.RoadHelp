import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';

import '/models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class RepairPlaceDetailsScreen extends StatelessWidget {
  static String routeName = "/repair_place_details";

  const RepairPlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    //final ProductDetailsArguments agrs = ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    final GarageDetailsArguments agrs =
        GarageDetailsArguments(garage: demoGarages[0]);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.garage.ratingAvg!),
      ),
      body: Body(garage: agrs.garage),
    );
  }
}

class GarageDetailsArguments {
  final Garage garage;

  GarageDetailsArguments({required this.garage});
}
