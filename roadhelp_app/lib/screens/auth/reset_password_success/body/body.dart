import 'package:flutter/material.dart';
import 'package:roadhelp/screens/auth/sign_in/sign_in_screen.dart';
import '/components/default_button.dart';
import '/screens/home/home_screen.dart';
import '../../../../config/size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/complete.jpg",
          height: SizeConfig.screenHeight * 0.2, //40%
          width: SizeConfig.screenWidth * 1,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Đổi mật khẩu thành công",
          // (texttitle),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          "Yêu cầu đổi mật khẩu của bạn đã thành công",
          //(textcontent),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Quay lại trang đăng nhập",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
