import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadhelp/config/size_config.dart';

import 'components/body.dart';

class MapPickerScreen extends StatelessWidget {
  static String routeName = "/route_name";

  Function(LatLng _latLngSelected, String _addressSelected) onPlacePicked;
  LatLng? initialCameraPosition;

  MapPickerScreen({
    required this.onPlacePicked,
    this.initialCameraPosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Map Picker",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(
        onPlacePicked: onPlacePicked,
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }
}
