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
import '/components/form_error.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';

class BeComeToPartnerForm extends StatefulWidget {
  @override
  _BeComeToPartnerFormState createState() => _BeComeToPartnerFormState();
}

class _BeComeToPartnerFormState extends State<BeComeToPartnerForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? phoneNumber;
  String? email;
  String? username;

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
          // buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildConformPassFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildFirstNameFormField(),
          //SizedBox(height: getProportionateScreenHeight(30)),
          //buildLastNameFormField(),
          //SizedBox(height: getProportionateScreenHeight(30)),

          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          FormError(errors: errors),
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
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Số Điện Thoại!",
        hintText: "Vui lòng nhập số điện thoại...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phonenumber.svg"),
      ),
    );
  }

  // TextFormField buildLastNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => lastName = newValue,
  //     onChanged: (value){
  //       if (value.trim().isNotEmpty) {
  //         removeError(error: kNamelNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kNamelNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Họ",
  //       hintText: "Vui lòng nhập họ của bạn...",
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Name.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildFirstNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => firstName = newValue,
  //     onChanged: (value) {
  //       if (value.trim().isNotEmpty) {
  //         removeError(error: kNamelNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kNamelNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Tên của bạn",
  //       hintText: "Vui lòng nhập tên của bạn!",
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Name.svg"),
  //     ),
  //   );
  // }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          removeError(error: kUserNameNullError);
        } else if (value.trim().length < 6) {
          removeError(error: kInvalidUserNameError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kUserNameNullError);
          return "";
        } else if (value.trim().length < 6) {
          addError(error: kInvalidUserNameError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Tên đăng nhập!",
        hintText: "Vui lòng nhập tên đăng nhập...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user_icon.svg"),
      ),
    );
  }

  // TextFormField buildConformPassFormField() {
  //   return TextFormField(
  //     obscureText: true,
  //     onSaved: (newValue) => conform_password = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kPassNullError);
  //       } else if (value.isNotEmpty && password == conform_password) {
  //         removeError(error: kMatchPassError);
  //       }
  //       conform_password = value;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kPassNullError);
  //         return "";
  //       } else if ((password != value)) {
  //         addError(error: kMatchPassError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Mật khẩu",
  //       hintText: "Vui lòng nhập lại mật khẩu...",
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildPasswordFormField() {
  //   return TextFormField(
  //     obscureText: true,
  //     onSaved: (newValue) => password = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kPassNullError);
  //       } else if (value.length >= 8) {
  //         removeError(error: kShortPassError);
  //       }
  //       password = value;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kPassNullError);
  //         return "";
  //       } else if (value.length < 8) {
  //         addError(error: kShortPassError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Mật khẩu!",
  //       hintText: "Vui lòng nhập mật khẩu...",
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
  //     ),
  //   );
  // }
  //

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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
      decoration: InputDecoration(
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
