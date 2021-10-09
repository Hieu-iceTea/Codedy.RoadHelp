import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/location_helper.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/components/custom_map.dart';

class Body extends StatefulWidget {
  LatLng? initialCameraPosition;
  Function(LatLng _latLngSelected, String _addressSelected) onPlacePicked;

  Body({
    this.initialCameraPosition,
    required this.onPlacePicked,
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _addressSelected = "Chạm vào bạn đồ để chọn vị trí";
  LatLng? _latLngSelected;
  bool isPlaceAddressLoading = false;

  Future<void> _onTap(LatLng newLatLng) async {
    _latLngSelected = newLatLng;

    setState(() {
      isPlaceAddressLoading = true;
    });
    _addressSelected = await LocationHelper.getPlaceAddress(
        _latLngSelected!.latitude, _latLngSelected!.longitude);
    setState(() {
      isPlaceAddressLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomMap(
            initialCameraPosition: widget.initialCameraPosition,
            onTap: (latLng) => _onTap(latLng),
          ),
          Positioned(
            bottom: 10,
            child: _panelBottom(opacity: 0.9),
          ),
          Positioned(
            top: 0,
            child: _panelTop(opacity: 0.9),
          ),
        ],
      ),
    );
  }

  Widget _panelTop({required double opacity}) {
    return Container(
      width: SizeConfig.screenWidth * 0.95,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Di chuyển và chạm đúng vị trí trên bản đồ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _panelBottom({required double opacity}) {
    return Container(
      width: SizeConfig.screenWidth * 0.95,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 18),
          isPlaceAddressLoading
              ? CircularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(20),
                  ),
                  child: Text(
                    _addressSelected,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: SizeConfig.screenWidth * 0.75,
                child: DefaultButton(
                  text: "Xác nhận",
                  press: () {
                    widget.onPlacePicked(_latLngSelected!, _addressSelected);
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
