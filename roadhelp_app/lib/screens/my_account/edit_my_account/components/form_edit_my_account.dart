import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/components/custom_surfix_icon.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/providers/user_provider.dart';

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
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Lưu",
            press: () => _saveForm(),
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: _user.firstName,
      onSaved: (newValue) => _user.firstName = newValue,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Xin hãy điền họ của bạn";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Họ",
        hintText: "Nhập họ của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue: _user.lastName,
      onSaved: (newValue) => _user.lastName = newValue,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Xin hãy điền tên của bạn";
        }
        return null;
      },
      decoration: InputDecoration(
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
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập điện thoại của bạn";
        }
        if (value.length < 10) {
          return "Kích thước phải lớn hơn 10";
        }
        return null;
      },
      decoration: InputDecoration(
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
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập email của bạn";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return "Email của bạn sai định dạng";
        }
        return null;
      },
      decoration: InputDecoration(
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
        // hintText: "-- Chọn Giới tính của bạn --",
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
