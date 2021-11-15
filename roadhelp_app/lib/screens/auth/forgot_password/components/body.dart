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
import 'forgot_password_form.dart';

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
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
