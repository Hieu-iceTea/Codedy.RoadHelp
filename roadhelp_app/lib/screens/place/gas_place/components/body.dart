import 'package:flutter/material.dart';

import '../../../../../components/custom_map.dart';
import 'header_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        CustomMap(
          /*markers: {
            const Marker(
                markerId: MarkerId('Marker_0'),
                position: LatLng(21.0291518, 105.8523056)),
            const Marker(
                markerId: MarkerId('Marker_1'),
                position: LatLng(21.0307539, 105.8523364)),
          },
          initialCameraPosition: LatLng(21.0291518, 105.8523056),
          onTap: (_) => {},*/
        ),
        Positioned(
          top: 10,
          child: HeaderBar(),
        ),
      ]),
    );
  }
}