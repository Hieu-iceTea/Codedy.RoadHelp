import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/partner/repair_place_manage_details/repair_place_manage_details_screen.dart';

import '/config/constants.dart';
import '/models/Cart.dart';
import '/config/size_config.dart';

class RepairPlaceItem extends StatelessWidget {
  const RepairPlaceItem({
    Key? key,
    required this.garage,
  }) : super(key: key);

  final Garage garage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        RepairPlaceManageDetailsScreen.routeName,
        //arguments: RepairPlaceManageDetailsArguments(garage: demoGarages[index]),
      ),
      leading: Hero(
        tag: garage.id.toString(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(garage.imageUrls![0]),
        ),
      ),
      title: Text(garage.name!),
      subtitle: Text(garage.address!),
    );
  }
}
