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
    return Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(
          context,
          RepairPlaceDetailsScreen.routeName,
          arguments: RepairPlaceDetailsArguments(garage: garage),
        ),
        leading: Hero(
            tag: garage.id.toString(),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: garage.garageImages.isNotEmpty
                  ? AspectRatio(
                      aspectRatio: 3 / 2,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/placeholder_processing.gif",
                        image: garage.garageImages[0].imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Text("No\nImage", textAlign: TextAlign.center),
            )),
        title: Text(garage.name!),
        subtitle: Text(garage.phone! + '\n' + garage.address! + '| 2 Km'),
        trailing: RoundedIconBtn(
          icon: Icons.directions,
          showShadow: true,
          press: () {},
        ),
        isThreeLine: true,
      ),
    );
  }
}
