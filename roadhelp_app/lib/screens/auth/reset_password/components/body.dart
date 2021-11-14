import 'package:flutter/material.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text("Đổi Mật Khẩu", style: headingStyle),
                  Text(
                    "Vui lòng nhập mật khẩu cũ và xác nhận mật khẩu mới\n để thay đổi mật khẩu nhé!",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  // ChangePasswordForm(
                  //   user: authProvider.authData.currentUser!,
                  // ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),

                  SizedBox(height: getProportionateScreenHeight(0)),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
