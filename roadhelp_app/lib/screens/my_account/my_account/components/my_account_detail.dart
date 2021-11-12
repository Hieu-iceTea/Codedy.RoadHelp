import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/user.dart';

class MyAccountDetail extends StatelessWidget {
  const MyAccountDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              /*left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),*/
              bottom: getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tên tài khoản: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        user.username!,
                        style: TextStyle(color: kTextColor, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Họ và tên: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      if (user.firstName == null || user.lastName == null)
                        Text(
                          "Bạn chưa cập nhập họ và tên",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      if (user.firstName != null || user.lastName != null)
                        Text(
                          user.firstName! + " " + user.lastName!,
                          style: TextStyle(color: kTextColor, fontSize: 17),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Số điện thoại: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        user.phone!,
                        style: TextStyle(color: kTextColor, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        user.email!,
                        style: TextStyle(color: kTextColor, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  leading: Icon(Icons.trending_up_outlined),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Giới tính: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      if (user.gender == null)
                        Text(
                          "Bạn chưa cập nhập giới tính",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      if (user.gender != null)
                        Text(
                          user.gender!.name,
                          style: TextStyle(color: kTextColor, fontSize: 17),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
