import 'package:flutter/material.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_detail.dart';
import 'package:roadhelp/screens/my_account/my_account/components/my_account_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            MyAccountPic(),
            SizedBox(height: 40),
            MyAccountDetail(
              title: "User name",
              content: "Codedy",
            ),
            SizedBox(height: 15),
            MyAccountDetail(
              title: "Full name",
              content: "Codedy",
            ),
            SizedBox(height: 15),
            MyAccountDetail(
              title: "Phone",
              content: "0978123456",
            ),
            SizedBox(height: 15),
            MyAccountDetail(
              title: "Email",
              content: "codedy@gmail.com",
            ),
            SizedBox(height: 15),
            MyAccountDetail(
              title: "Gender",
              content: "male",
            ),
          ],
        ),
      ),
    );
  }
}
