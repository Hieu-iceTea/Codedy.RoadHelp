import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/my_account/edit_my_account/components/form_edit_my_account.dart';
import 'package:roadhelp/screens/my_account/edit_my_account/components/my_account_pic.dart';


class Body extends StatelessWidget {

  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Sửa thông tin tài khoản",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  MyAccountPic(),
                  // Text(
                  //   "Sign in with your email and password  \nor continue with social media",
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  FormEditMyAccount(user: authProvider.authData.currentUser!,),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
