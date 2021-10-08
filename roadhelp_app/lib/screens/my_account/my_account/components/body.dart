import 'package:flutter/material.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_detail.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          MyAccountPic(),
          SizedBox(height: 40),
          MyAccountDetail(
            title: "user name",
            content: "Codedy",
          ),
          SizedBox(height: 15),
          MyAccountDetail(
            title: "full name",
            content: "Codedy",
          ),
          SizedBox(height: 15),
          MyAccountDetail(
            title: "phone",
            content: "0978123456",
          ),
          SizedBox(height: 15),
          MyAccountDetail(
            title: "email",
            content: "codedy@gmail.com",
          ),
          SizedBox(height: 15),
          MyAccountDetail(
            title: "gender",
            content: "male",
          ),
        ],
      ),
    );
  }
}
