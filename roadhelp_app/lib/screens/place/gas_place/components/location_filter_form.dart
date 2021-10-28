import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/district.dart';
import 'package:roadhelp/models/province.dart';
import 'package:roadhelp/models/ward.dart';
import 'package:roadhelp/repositories/district_repository.dart';
import 'package:roadhelp/repositories/province_repository.dart';
import 'package:roadhelp/repositories/ward_repository.dart';

import '/components/default_button.dart';

class LocationFilterForm extends StatefulWidget {
  Function(Province provinceSelected, District districtSelected,
      Ward wardSelected) onSubmit;

  LocationFilterForm({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  _LocationFilterFormState createState() => _LocationFilterFormState();
}

class _LocationFilterFormState extends State<LocationFilterForm> {
  final _formKey = GlobalKey<FormState>();

  Province? provinceSelected; // Tỉnh/Thành Phố
  District? districtSelected; // Quận/Huyện
  Ward? wardSelected; // Xã/Phường

  List<Province>? provinceListItems;
  List<District>? districtListItems;
  List<Ward>? wardListItems;

  bool isLoadProvince = false;
  bool isLoadDistrict = false;
  bool isLoadWard = false;

  @override
  void didChangeDependencies() {
    _fetchAllDataProvince(context);
    /*_fetchAllDataDistrict(context, provinceId: 1);
    _fetchAllDataWard(context, provinceId: 1, districtId: 1);*/

    super.didChangeDependencies();
  }

  Future<void> _fetchAllDataProvince(BuildContext context) async {
    setState(() {
      isLoadProvince = true;
    });

    List<Province> provinces = await ProvinceRepository.findAll();

    setState(() {
      provinceListItems = provinces;
      isLoadProvince = false;
    });
  }

  Future<void> _fetchAllDataDistrict(BuildContext context,
      {required int provinceId}) async {
    setState(() {
      isLoadDistrict = true;
    });

    List<District> districts =
        await DistrictRepository.findAllByProvinceId(provinceId);

    setState(() {
      districtListItems = districts;
      isLoadDistrict = false;
    });
  }

  Future<void> _fetchAllDataWard(BuildContext context,
      {required int provinceId, required int districtId}) async {
    setState(() {
      isLoadWard = true;
    });

    List<Ward> wards = await WardRepository.findAllByProvinceIdAndDistrictId(
        provinceId, districtId);

    setState(() {
      wardListItems = wards;
      isLoadWard = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              isLoadProvince
                  ? const CircularProgressIndicator()
                  : buildProvinceDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              isLoadDistrict
                  ? const CircularProgressIndicator()
                  : buildDistrictDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              isLoadWard
                  ? const CircularProgressIndicator()
                  : buildWardDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(50)),
              DefaultButton(
                text: "Okey",
                press: () => _submitForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField buildProvinceDropdownFormField() {
    return DropdownButtonFormField(
      isExpanded: true,
      onSaved: (newValue) => provinceSelected = newValue,
      value: provinceSelected,
      icon: const Icon(Icons.arrow_drop_down),
      //style: const TextStyle(color: kPrimaryColor),
      onChanged: (newValue) {
        setState(() {
          provinceSelected = newValue!;
          //
          districtSelected = null;
          districtListItems = null;
          wardSelected = null;
          wardListItems = null;
        });
        _fetchAllDataDistrict(context, provinceId: (newValue as Province).id!);
      },
      validator: (value) {
        if (value == null) {
          return "Please Select your province";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Province",
        hintText: "-- Select Province --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
      ),
      items:
          provinceListItems?.map<DropdownMenuItem<Province>>((Province value) {
        return DropdownMenuItem<Province>(
          value: value,
          child: Text(value.name!),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildDistrictDropdownFormField() {
    return DropdownButtonFormField(
      isExpanded: true,
      onSaved: (newValue) => districtSelected = newValue,
      value: districtSelected,
      icon: const Icon(Icons.arrow_drop_down),
      //style: const TextStyle(color: kPrimaryColor),
      onChanged: (newValue) {
        setState(() {
          districtSelected = newValue!;
          //
          wardSelected = null;
          wardListItems = null;
        });

        _fetchAllDataWard(context,
            provinceId: provinceSelected!.id!,
            districtId: (newValue as District).id!);
      },
      validator: (value) {
        if (value == null) {
          return "Please Select your district";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "District",
        hintText: "-- Select District --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
      ),
      items:
          districtListItems?.map<DropdownMenuItem<District>>((District value) {
        return DropdownMenuItem<District>(
          value: value,
          child: Text(value.name!),
        );
      }).toList(),
    );
  }

  DropdownButtonFormField buildWardDropdownFormField() {
    return DropdownButtonFormField(
      isExpanded: true,
      onSaved: (newValue) => wardSelected = newValue,
      value: wardSelected,
      icon: const Icon(Icons.arrow_drop_down),
      //style: const TextStyle(color: kPrimaryColor),
      onChanged: (newValue) {
        setState(() {
          wardSelected = newValue!;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Please Select your ward";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Ward",
        hintText: "-- Select Ward --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
      ),
      items: wardListItems?.map<DropdownMenuItem<Ward>>((Ward value) {
        return DropdownMenuItem<Ward>(
          value: value,
          child: Text(value.name!),
        );
      }).toList(),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSubmit(provinceSelected!, districtSelected!, wardSelected!);

      Navigator.of(context).pop();
    }
  }
}
