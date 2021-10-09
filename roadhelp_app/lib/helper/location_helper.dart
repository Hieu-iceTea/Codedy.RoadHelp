import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';

//TODO: Hiện tại đang dùng key của: hieuit-demo-learn-flutter-chat -> [Codedy-RoadHelp-tmp]
const GOOGLE_API_KEY =
    'AIzaSyA6Ks6oY3LRvI9Y0MlxEaTOdGQuaUjPbfk'; //API key Codedy-RoadHelp: AIzaSyAun5GuPDwfyT6UgROnif548xHq1p4sHqQ

class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?&zoom=16&size=600x300&markers=color:red|$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    //final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
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
