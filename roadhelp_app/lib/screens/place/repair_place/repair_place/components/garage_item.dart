import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_details/repair_place_details_screen.dart';

class GarageItem extends StatelessWidget {
  Garage garage;

  GarageItem({
    required this.garage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        RepairPlaceDetailsScreen.routeName,
        arguments: RepairPlaceDetailsArguments(garage: garage),
      ),
      leading: Hero(
        tag: garage.id.toString(),
        child: Image.network("https://picsum.photos/500/400?random=1"),
      ),
      title: Text(garage.name!),
      subtitle: Text(garage.phone! + '\n' + garage.address! + '| 2 Km'),
      trailing: RoundedIconBtn(
        icon: Icons.directions,
        showShadow: true,
        press: () {},
      ),
      isThreeLine: true,
    );
  }
}
