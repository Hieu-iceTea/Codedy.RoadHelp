import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import '/components/default_button.dart';

class LocationFilterForm extends StatefulWidget {
  @override
  _LocationFilterFormState createState() => _LocationFilterFormState();
}

class _LocationFilterFormState extends State<LocationFilterForm> {
  final _formKey = GlobalKey<FormState>();

  String? provinceSelected; // Tỉnh/Thành Phố
  String? districtSelected; // Quận/Huyện
  String? wardSelected; // Xã/Phường

  List<String>? provinceListItems = ['Province 1', 'Province 2', 'Province 3'];
  List<String>? districtListItems = ['District 1', 'District 2', 'District 3'];
  List<String>? wardListItems = ['Ward 1', 'Ward 2', 'Ward 3'];

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
              buildProvinceDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildDistrictDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildWardDropdownFormField(),
              SizedBox(height: getProportionateScreenHeight(50)),
              DefaultButton(
                text: "Filter",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
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
          //dropdownCityValue = newValue!;
        });
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
      items: provinceListItems?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
          //dropdownCityValue = newValue!;
        });
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
      items: districtListItems?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
          //dropdownCityValue = newValue!;
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
      items: wardListItems?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
