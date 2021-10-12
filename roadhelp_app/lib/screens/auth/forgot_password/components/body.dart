import 'package:flutter/material.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/components/form_error.dart';
import '../../components/no_account_text.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Quên Mật Khẩu",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Vui lòng nhập số điện thoại của bạn để lấy lại mật khẩu!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? phonenumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phonenumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
                setState(() {
                  errors.remove(kPhoneNumberNullError);
                });
              } else if (phoneValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidPhoneNumberError)) {
                setState(() {
                  errors.remove(kInvalidPhoneNumberError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
                setState(() {
                  errors.add(kPhoneNumberNullError);
                });
              } else if (!phoneValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidPhoneNumberError)) {
                setState(() {
                  errors.add(kInvalidPhoneNumberError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Số điện thoại",
              hintText: "Nhập số điện thoại...",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phonenumber.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Lấy Mật Khẩu",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}

