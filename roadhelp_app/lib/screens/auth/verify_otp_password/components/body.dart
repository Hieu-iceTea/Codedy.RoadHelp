import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadhelp/screens/auth/verify_otp_password/components/verify_otp_password_form.dart';

import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';
import '../verify_otp_password_screen.dart';

class Body extends StatelessWidget {
  String to;
  Function(String) onSubmit;
  Function() onResend;

  Body({
    required this.to,
    required this.onSubmit,
    required this.onResend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Xác minh OTP",
                style: headingStyle,
              ),
              Text(
                "Chúng tôi đã gửi mã xác minh của bạn đến " + to,
                textAlign: TextAlign.center,
              ),
              buildTimer(),
              VerifyOtpPassword(onSubmit: onSubmit),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  onResend();
                },
                child: Text(
                  "Gửi lại mã OTP",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bạn có thể gửi lại mã trong "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
