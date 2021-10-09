import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/screens/map_picker/map_picker_screen.dart';

import '/helper/location_helper.dart';

class LocationInput extends StatefulWidget {
  Function(LatLng latLngSelected) onSelectPlace;

  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  LatLng? _latLngSelected;

  void _showPreview(LatLng latLng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      _latLngSelected = LatLng(locData.latitude!, locData.longitude!);
      _showPreview(_latLngSelected!);
      widget.onSelectPlace(_latLngSelected!);
    } catch (error) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapPickerScreen(
          initialCameraPosition: _latLngSelected,
          onPlacePicked: (latLngSelected, addressSelected) {
            _showPreview(latLngSelected);
            _latLngSelected = latLngSelected;
            widget.onSelectPlace(latLngSelected);

            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: kPrimaryColor,
              ),
              icon: const Icon(
                Icons.location_on,
              ),
              label: Text('Current Location'),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: kPrimaryColor,
              ),
              icon: const Icon(
                Icons.map,
              ),
              label: Text('Select on Map'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
