import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/components/custom_surfix_icon.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/components/form_error.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/auth/complete_profile/complete_profile_screen.dart';
import 'package:roadhelp/screens/my_account/change_password_success/change_password_success_screen.dart';
import 'package:roadhelp/screens/my_account/my_account/my_account_screen.dart';
import '../../../../config/size_config.dart';
import '../../../../config/constants.dart';

class ChangePasswordForm extends StatefulWidget {
  User? user;

  ChangePasswordForm({Key? key, this.user}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<ChangePasswordForm> {
  User _user = User();
  final _formKey = GlobalKey<FormState>();
  String? oldPassword;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  @override
  void initState() {
    _user = widget.user ?? User();

    super.initState();
  }

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
            // press: () => _saveForm(),
            press: () {
              if (_formKey.currentState!.validate()) {
                _saveForm();
                _formKey.currentState!.save();
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
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kPassNewError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEnterPassNewNullError);
          return "";
        } else if ((password != value)) {
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
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNewNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        } else if (value != oldPassword) {
          removeError(error: kPassNewEqualOldError);
        }

        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNewNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        } else if (value == oldPassword) {
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => oldPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassOldNullError);
        } else if (value.trim().length >= 8) {
          removeError(error: kShortPassError);
        }

        oldPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassOldNullError);
          return "";
        } else if (value.trim().length < 8) {
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

  Future<void> _saveForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    try {
      if (_user.id != null) {
        await Provider.of<AuthProvider>(context, listen: false)
            .changePassword(password!, oldPassword!);

        Navigator.of(context).pop();
      }
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
