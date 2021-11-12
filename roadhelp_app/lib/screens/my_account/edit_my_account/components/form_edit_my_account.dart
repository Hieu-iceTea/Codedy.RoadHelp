import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/components/custom_surfix_icon.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/providers/user_provider.dart';
import 'package:roadhelp/screens/my_account/edit_account_success/edit_my_account_success_screen.dart';
import 'package:roadhelp/screens/my_account/my_account/my_account_screen.dart';

import '/components/default_button.dart';
import '/components/form_error.dart';
import '../../../../config/constants.dart';
import '/helper/keyboard.dart';
import '/screens/login_success/login_success_screen.dart';
import '../../../../config/size_config.dart';

class FormEditMyAccount extends StatefulWidget {
  User? user;

  FormEditMyAccount({Key? key, this.user}) : super(key: key);

  @override
  _FormEditMyAccountState createState() => _FormEditMyAccountState();
}

class _FormEditMyAccountState extends State<FormEditMyAccount> {
  User _user = User();
  final _formKey = GlobalKey<FormState>();

  List<UserGender> userGenders = UserGender.values;

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
  void initState() {
    _user = widget.user ?? User();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderDropdownFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Lưu",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _saveForm();
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      initialValue: _user.firstName,
      onSaved: (newValue) => _user.firstName = newValue,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          removeError(error: kShortFirstNameError);
        } else if (value.trim().length >= 2) {
          removeError(error: kShortFirstNameError);
        }

        _user.firstName = value;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          addError(error: kShortFirstNameError);
          return "";
        } else if (value.trim().length < 2) {
          addError(error: kShortFirstNameError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Họ",
        hintText: "Nhập họ của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      initialValue: _user.lastName,
      onSaved: (newValue) => _user.lastName = newValue,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          removeError(error: kNamelNullError);
        } else if (value.trim().length >= 2) {
          removeError(error: kShortLastNameError);
        }

        _user.firstName = value;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          addError(error: kNamelNullError);
          return "";
        } else if (value.trim().length < 2) {
          addError(error: kShortLastNameError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tên",
        hintText: "Nhập tên của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: _user.phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => _user.phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (phoneValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidPhoneNumberError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (!phoneValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneNumberError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: _user.email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _user.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Nhập email của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  DropdownButtonFormField buildGenderDropdownFormField() {
    return DropdownButtonFormField(
      value: _user.gender,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      items: userGenders.map<DropdownMenuItem<UserGender>>((UserGender value) {
        return DropdownMenuItem<UserGender>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      onSaved: (newValue) => _user.gender = newValue,
      onChanged: (newValue) {
        setState(() {
          _user.gender = newValue!;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Vui lòng chọn giới tính của bạn";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Giới tính",
        hintText: "-- Chọn Giới tính của bạn --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
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
      await Provider.of<AuthProvider>(context, listen: false).updateCurrentUser(_user);

      Navigator.of(context).pop();
    }
  } catch (error) {
    await Util.showDialogNotification(
        context: context, content: error.toString());
  }
}
}
