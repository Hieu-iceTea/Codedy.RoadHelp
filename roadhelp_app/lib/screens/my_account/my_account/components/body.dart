import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_detail.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_pic.dart';

class Body extends StatelessWidget {

  const Body({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Container(
        constraints: BoxConstraints(
          minWidth: double.maxFinite,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              MyAccountPic(imageUrl: authProvider.authData.currentUser?.imageUrl),
              SizedBox(height: 40),
              MyAccountDetail(
                user: authProvider.authData.currentUser!,
              ),
              // SizedBox(height: 15),
              // MyAccountDetail(
              //   title: "Full name",
              //   content: "Codedy",
              // ),
              // SizedBox(height: 15),
              // MyAccountDetail(
              //   title: "Phone",
              //   content: "0978123456",
              // ),
              // SizedBox(height: 15),
              // MyAccountDetail(
              //   title: "Email",
              //   content: "codedy@gmail.com",
              // ),
              // SizedBox(height: 15),
              // MyAccountDetail(
              //   title: "Gender",
              //   content: "male",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
