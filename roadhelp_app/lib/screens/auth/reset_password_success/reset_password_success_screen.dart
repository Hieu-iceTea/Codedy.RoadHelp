import 'package:flutter/material.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/screens/auth/sign_in/sign_in_screen.dart';

class ResetPasswordSuccess extends StatefulWidget {
  static String routeName = "/reset_password_success";

  const ResetPasswordSuccess({Key? key}) : super(key: key);

  @override
  _ResetPasswordSuccessState createState() => _ResetPasswordSuccessState();
}

class _ResetPasswordSuccessState extends State<ResetPasswordSuccess> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: Text("Reset Password Success"),
        ),
        body: Column(
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
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Yêu cầu đổi mật khẩu của bạn đã thành công",
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
        )
    );
  }
}
