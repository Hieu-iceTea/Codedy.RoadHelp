import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/components/location_filter_form.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/config/size_config.dart';
import 'location_input.dart';

class RepairPlaceForm extends StatefulWidget {
  Garage? garage;

  RepairPlaceForm({Key? key, this.garage}) : super(key: key);

  @override
  _RepairPlaceFormState createState() => _RepairPlaceFormState();
}

class _RepairPlaceFormState extends State<RepairPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  final _provinceDistrictWardController = TextEditingController();

  /*String? name;
  String? phone;
  String? address;
  String? description;*/

  @override
  void initState() {
    //initial value
    /*name = widget.garage?.name;
    phone = widget.garage?.phone;
    address = widget.garage?.address;
    description = widget.garage?.description;*/

    //widget.garage ??= Garage(); //Khởi tạo nếu null

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.garage ??= Garage(); //Khởi tạo nếu null
    final String modeStr = widget.garage?.id == null ? "Thêm mới" : "Cập nhật";

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildProvinceDistrictWardSelectDialog(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLocationInput(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDescriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: modeStr,
            press: () => _saveForm(),
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      initialValue: widget.garage?.name,
      onSaved: (newValue) => widget.garage!.name = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      initialValue: widget.garage?.phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => widget.garage!.phone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your phone";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone",
        hintText: "Enter your phone",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      initialValue: widget.garage?.address,
      onSaved: (newValue) => widget.garage!.address = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your address";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildProvinceDistrictWardSelectDialog() {
    String initialValue = "";
    if (widget.garage?.province?.name != null &&
        widget.garage?.district?.name != null &&
        widget.garage?.ward?.name != null) {
      initialValue = widget.garage!.province!.name! +
          " / " +
          widget.garage!.district!.name! +
          " / " +
          widget.garage!.ward!.name!;

      _provinceDistrictWardController.text = initialValue;
    }

    return TextFormField(
      controller: _provinceDistrictWardController,
      //initialValue: initialValue, //Không thể cùng lúc dùng controller và initialValue
      //onSaved: (newValue) => widget.garage!.name = newValue,
      onTap: () => _showMyDialog(),
      readOnly: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Select your Location";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Tỉnh / Huyện / Xã",
        hintText: "-- Select your location --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      initialValue: widget.garage?.description,
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      onSaved: (newValue) => widget.garage!.description = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter description";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Description",
        hintText: "Enter your description",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Chat bubble Icon.svg"),
      ),
    );
  }

  Widget buildLocationInput() {
    return LocationInput(
      onSelectPlace: (latLngSelected) {
        widget.garage!.latitude = latLngSelected.latitude;
        widget.garage!.longitude = latLngSelected.longitude;
      },
      latLngInitial: widget.garage?.latitude != null
          ? LatLng(widget.garage!.latitude!, widget.garage!.longitude!)
          : null,
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Location Select',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: LocationFilterForm(
            onSubmit: (provinceSelected, districtSelected, wardSelected) {
              widget.garage!.province = provinceSelected;
              widget.garage!.district = districtSelected;
              widget.garage!.ward = wardSelected;
              _provinceDistrictWardController.text = provinceSelected.name! +
                  " / " +
                  districtSelected.name! +
                  " / " +
                  wardSelected.name!;
            },
          ),
        );
      },
    );
  }

  Future<void> _saveForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    try {
      if (widget.garage!.id == null) {
        await Provider.of<GarageProvider>(context, listen: false)
            .create(widget.garage!);
      } else {
        await Provider.of<GarageProvider>(context, listen: false)
            .update(widget.garage!);
      }

      Navigator.of(context).pop();
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
