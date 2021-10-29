import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';

const GOOGLE_API_KEY =
    'AIzaSyCPGSoVHrfLmvJO6TF760Sc1IlbwNUkj5M'; // demo.hieu.icetea@gmail.com / Codedy_RoadHelp_Project

class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
    int width = 600,
    int height = 300,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?&zoom=16&size=${width}x$height&markers=color:red|$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }

  static Future<LocationData?> getCurrentLocation() async {
    //https://pub.dev/packages/location
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    try {
      _locationData = await location.getLocation();
    } catch (error) {
      print(error);
      return null;
    }

    //location.enableBackgroundMode(enable: true);

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });

    return _locationData;
  }
}
