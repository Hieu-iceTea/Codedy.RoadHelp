import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadhelp/helper/location_helper.dart';

class CustomMap extends StatefulWidget {
  LatLng? initialCameraPosition;
  ArgumentCallback<LatLng>? onTap;
  Set<Marker> markers;

  CustomMap({
    this.initialCameraPosition,
    this.onTap,
    this.markers = const {},
    Key? key,
  }) : super(key: key);

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  LatLng? _pickedLocation;
  late Set<Marker> _markers;

  @override
  void initState() {
    _markers = widget.markers;
    if (widget.initialCameraPosition == null) {
      _getInitialCameraPosition();
    }
    super.initState();
  }

  Future<void> _getInitialCameraPosition() async {
    var currentLocation = await LocationHelper.getCurrentLocation();
    setState(() {
      if (currentLocation == null) {
        widget.initialCameraPosition =
            const LatLng(21.0291518, 105.8523056); //Hồ Gươm, Hà Nội
        return;
      }
      widget.initialCameraPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  ArgumentCallback<LatLng>? _onTap(LatLng position) {
    if (widget.onTap == null) {
      return null;
    }

    setState(() {
      _pickedLocation = position;
    });

    _markers = {
      ...widget.markers,
      Marker(
          markerId: const MarkerId('marker_picked_1'),
          position: _pickedLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange)),
    };

    widget.onTap!(position);
  }

  @override
  Widget build(BuildContext context) {
    return widget.initialCameraPosition == null
        ? const Center(child: CircularProgressIndicator())
        : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.initialCameraPosition!,
              zoom: 16,
            ),
            onTap: _onTap,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            padding: EdgeInsets.only(
              top: 60,
              bottom: 100,
            ),
            onMapCreated: (GoogleMapController controller) {
              //required to apply padding correctly on Android
              setState(() {});
            },
          );
  }
}
