import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

const GOOGLE_API_KEY =
    'AIzaSyCPGSoVHrfLmvJO6TF760Sc1IlbwNUkj5M'; // demo.hieu.icetea@gmail.com / Codedy_RoadHelp_Project

class LocationHelper {
  static const String _locationDataKey = "Location_Data";

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

  static Future<LocationData> getCurrentLocation() async {
    //https://pub.dev/packages/location
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception("Dịch vụ vị trí đang tắt. Hãy bật vị trí và thử lại");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception(
            "Không có quyền truy cập vị trí thiết bị. Hãy cho phép truy cập vị trí và thử lại");
      }
    }

    try {
      _locationData = await location.getLocation().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              'Hết thời gian chờ định vị vị trí phản hồi, Hãy di chuyển tới vị trí thông thoáng hơn để bắt sóng GPS tốt hơn.');
        },
      );
    } catch (error) {
      rethrow;
    }

    //location.enableBackgroundMode(enable: true);

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });

    return _locationData;
  }

  static Future<LatLng> getCurrentLocationCache({bool refresh = false}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    //Nếu không có data từ SharedPreferences || hoặc refresh == true
    if (refresh || !sharedPreferences.containsKey(_locationDataKey)) {
      LocationData currentLocation = await getCurrentLocation();
      LatLng latLng =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);

      //Lưu dữ liệu vào SharedPreferences
      sharedPreferences.setString(_locationDataKey, json.encode(latLng));

      return latLng;
    }

    // Lấy data từ SharedPreferences:
    var extractedLocationData =
        json.decode(sharedPreferences.getString(_locationDataKey)!);
    return LatLng.fromJson(extractedLocationData)!;
  }

  static Future<double> getDistanceInKilometers(
      double startLatitude, double startLongitude) async {
    var _currentLocation = await LocationHelper.getCurrentLocationCache();

    var _distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      _currentLocation.latitude,
      _currentLocation.longitude,
    );

    return _distanceInMeters / 1000;
  }
}
