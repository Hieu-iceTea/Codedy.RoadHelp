import 'package:flutter/material.dart';
import 'package:roadhelp/components/custom_surfix_icon.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/components/form_error.dart';
import 'package:roadhelp/screens/auth/complete_profile/complete_profile_screen.dart';
import '../../../../config/size_config.dart';
import '../../../../config/constants.dart';



class ChangePasswordForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? passwordOld;
  String? passwordNew;
  String? conform_password;
  bool remember = false;
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
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Đổi mật khẩu",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                //if all are valid then go to success screen
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEnterPassNewNullError);
        } else if (value.isNotEmpty && passwordNew == conform_password) {
          removeError(error: kPassNewError);

        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEnterPassNewNullError);
          return "";
        }
        else if ((passwordNew != value)) {
          addError(error: kPassNewError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu mới",
        hintText: "Nhập lại mật khẩu mới...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => passwordNew = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNewNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        } else if (value != passwordOld)
        {
          removeError(error: kPassNewEqualOldError);
        }

        passwordNew = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNewNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }else if(value == passwordOld)
        {
          addError(error: kPassNewEqualOldError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu mới",
        hintText: "Nhập mật khẩu mới...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(  svgIcon: "assets/icons/pass.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => passwordOld = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassOldNullError);
        }
        else if (value.trim().length >= 8) {
          removeError(error: kShortPassError);
        }

        passwordOld = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassOldNullError);
          return "";
        }
        else if (value.trim().length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu cũ",
        hintText: "Nhập mật khẩu cũ...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
      ),
    );
  }
}
