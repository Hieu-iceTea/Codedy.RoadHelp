import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/components/form_error.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/keyboard.dart';

import 'location_form.dart';

class FormReceiveRescue extends StatefulWidget {
  const FormReceiveRescue({Key? key}) : super(key: key);

  @override
  _FormReceiveRescueState createState() => _FormReceiveRescueState();
}

class _FormReceiveRescueState extends State<FormReceiveRescue> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? phoneNumber;
  String? detailedError;
  List<String>? detailedErrorItem = [
    'Thủng săm',
    'Tuột xích',
    'Hỏng phanh',
    'Chết máy',
    'Lỗi Khác'
  ];
  String? description;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDetailedErrorDropdownFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDescriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildLocation(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Rescue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (phoneNumberValidatorRegExp.hasMatch(value)) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (!phoneNumberValidatorRegExp.hasMatch(value)) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  DropdownButtonFormField buildDetailedErrorDropdownFormField() {
    return DropdownButtonFormField(
      isExpanded: true,
      onSaved: (newValue) => detailedError = newValue,
      value: detailedError,
      icon: const Icon(Icons.arrow_drop_down),
      //style: const TextStyle(color: kPrimaryColor),
      onChanged: (newValue) {
        setState(() {
          //dropdownCityValue = newValue!;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Please Select your detail error";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Gender",
        hintText: "-- Select Detail Error --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
      ),
      items: detailedErrorItem?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      onSaved: (newValue) => description = newValue,
      onChanged: (value) {
        return null;
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kUserNameNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Enter your description",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Padding buildLocation() {
    String? location = 'ton that thuyet';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: _showMyDialog,
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(
              width: 20,
              height: 35,
            ),
            Expanded(child: Text(location)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Location Filter',
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
          content: LocationForm(),
        );
      },
    );
  }
}
