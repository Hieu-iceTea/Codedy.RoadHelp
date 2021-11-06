import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/home/home_screen.dart';
import 'package:roadhelp/screens/my_account/success_partner/success_partner_screen.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';

class BeComeToPartnerForm extends StatefulWidget {
  @override
  _BeComeToPartnerFormState createState() => _BeComeToPartnerFormState();
}

class _BeComeToPartnerFormState extends State<BeComeToPartnerForm> {
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  String? email;
  String? username;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Đăng Kí",
            press: _submitForm,
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Số Điện Thoại",
        hintText: "Vui lòng nhập số điện thoại...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phonenumber.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kUserNameNullError;
        } else if (value.trim().length < 6) {
          return kInvalidUserNameError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tên đăng nhập",
        hintText: "Vui lòng nhập tên đăng nhập...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user_icon.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Vui lòng nhập Email...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/email.svg"),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    KeyboardUtil.hideKeyboard(context);

    try {
      Auth authResponse =
          await Provider.of<AuthProvider>(context, listen: false)
              .becomeToPartner();

      /*await Util.showDialogNotification(
          context: context, title: "Thông báo", content: authResponse.message);*/

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PartnerSuccessScreen(
            "Hoàn thành",
            "Yêu cầu nâng cấp tài khoản của bạn đã được \n ghi nhận tại hệ thống. Bạn vui lòng đợi \n Admin kiểm duyệt nhé!!",
            HomeScreen.routeName),
      ));
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
