import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_details/repair_place_details_screen.dart';

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
        RepairPlaceDetailsScreen.routeName,
        arguments: RepairPlaceDetailsArguments(garage: garage, isManage: true),
      ),
      leading: Hero(
        tag: garage.id.toString(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(garage.images![0].imageUrl!),
        ),
      ),
      title: Text(garage.name!),
      subtitle: Text(garage.address!),
    );
  }
}
