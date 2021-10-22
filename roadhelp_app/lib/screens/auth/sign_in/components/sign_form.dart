import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/home/home_screen.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/components/form_error.dart';
import '/config/constants.dart';
import '/config/size_config.dart';
import '/helper/keyboard.dart';
import '/screens/auth/forgot_password/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Nhớ mật khẩu"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Quên mật khẩu",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Đăng Nhập",
            press: _submitForm,
          ),
        ],
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          removeError(error: kUserNameNullError);
        } else if (value.trim().length >= 5) {
          removeError(error: kInvalidUserNameError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kUserNameNullError);
          return "";
        } else if (value.trim().length < 5) {
          addError(error: kInvalidUserNameError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tài Khoản",
        hintText: "Nhập tài khoản...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user_icon.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mật Khẩu",
        hintText: "Nhập mật khẩu...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pass.svg"),
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
      Auth auth = Auth(username: username, password: password);

      Auth authResponse =
          await Provider.of<AuthProvider>(context, listen: false).login(auth);

      if (authResponse.isAuth) {
        //Navigator.pushReplacementNamed(context, HomeScreen.routeName);

        //Remove all routes:
        //https://stackoverflow.com/questions/45889341/flutter-remove-all-routes
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (Route<dynamic> route) => false);
      }

      //Nếu màn hình bắt đầu không phải là SignIn mà là Splash thì cần chuyển về màn hình bắt đầu
      //Navigator.of(context).pop(); //pop() nếu màn trước là Splash
      //Navigator.pushNamed(context, HomeScreen.routeName); //chuyển đến màn hình chủ sau khi login
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
