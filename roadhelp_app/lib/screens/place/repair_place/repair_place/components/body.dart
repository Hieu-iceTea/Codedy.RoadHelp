import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import '../../../../../components/custom_map.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<GarageProvider>(
        builder: (context, garageProvider, child) => CustomMap(
          markers: {
            /*Marker(
                  markerId: MarkerId('Marker_0' + garageProvider.items[0].id!.toString()),
                  position: LatLng(garageProvider.items[0].latitude!, garageProvider.items[0].longitude!)),*/

            if (garageProvider.items.isNotEmpty)
              ...garageProvider.items.map<Marker>(
                (e) => Marker(
                  markerId: MarkerId('Marker_' + e.id!.toString()),
                  position: LatLng(e.latitude!, e.longitude!),
                  infoWindow: InfoWindow(title: e.name),
                ),
              ),
          },

          initialCameraPosition: garageProvider.items.isNotEmpty
              ? LatLng(
                  garageProvider.items[0].latitude!,
                  garageProvider.items[0].longitude!,
                )
              : null,
          //onTap: (_) => {},
        ),
      ),
    );
  }
}
