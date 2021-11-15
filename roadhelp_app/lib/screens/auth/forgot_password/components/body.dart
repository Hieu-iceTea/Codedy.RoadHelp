import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/repositories/auth_repository.dart';
import 'package:roadhelp/screens/auth/otp/otp_screen.dart';
import 'package:roadhelp/screens/auth/reset_password/reset_password_screen.dart';
import 'package:roadhelp/screens/auth/verify_otp_password/verify_otp_password_screen.dart';

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
              const Text(
                "Vui lòng nhập Email của bạn!",
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
  List<String?> errors = [];
  String? email;

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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }

              email = value;
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
              hintText: "Vui lòng nhập Email...",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/email.svg"),
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Gửi OTP",
            press: () {
              if (_formKey.currentState!.validate()) {
                _submitForm();
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
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
      await Provider.of<AuthProvider>(context, listen: false)
          .resetPassword(email: email);

      // Navigator.pushNamed(context, VerifyOtpPasswordScreen.routeName,
      // arguments: VerityOtpArguments(
      //   to: email!,
      //   onSubmit: _submitVerificationResetPasswordCode,
      //   onResend: () {},
      // ));

      Navigator.pushNamed(
        context,
        OtpScreen.routeName,
        arguments: OtpArguments(
          to: email!,
          onSubmit: _submitVerificationResetPasswordCode,
          onResend: () {},
        ),
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }

  Future<void> _submitVerificationResetPasswordCode(
      String resetPasswordCode) async {
    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .resetPasswordVerification(email!, resetPasswordCode);

      Navigator.pushNamed(context, ResetPasswordScreen.routeName,
          arguments: ResetPasswordArgument(emailTo: email!));
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
