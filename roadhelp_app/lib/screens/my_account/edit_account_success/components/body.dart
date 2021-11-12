import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/screens/my_account/my_account/my_account_screen.dart';

import '/components/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Chỉnh sửa tài khoản thành công",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Tài khoản của tôi",
            press: () {
              Navigator.pushNamed(context, MyAccountScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
