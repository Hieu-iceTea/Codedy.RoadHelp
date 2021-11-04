import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadhelp/helper/location_helper.dart';

class MapImages extends StatefulWidget {
  const MapImages({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double? latitude;
  final double? longitude;

  @override
  _MapImagesState createState() => _MapImagesState();
}

class _MapImagesState extends State<MapImages> {
  String? _previewImageUrl;

  void _showPreview(LatLng latLng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      width: 600,
      height: 600,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.latitude != null && widget.longitude != null) {
      LatLng latLng = LatLng(widget.latitude!, widget.longitude!);
      //LatLng latLng = const LatLng(18.731120, 105.662068);
      _showPreview(latLng);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _previewImageUrl == null
        ? Container(
            alignment: Alignment.center,
            child: const Text('No Location Chosen'),
          )
        : FadeInImage.assetNetwork(
            placeholder: "assets/images/placeholder_processing.gif",
            image: _previewImageUrl!,
            fit: BoxFit.cover,
            //width: double.infinity,
          );
  }
}
