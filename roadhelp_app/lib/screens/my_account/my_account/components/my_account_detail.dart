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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),
              bottom: getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User name: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        user.username!,
                        style: TextStyle(color: kTextColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full name: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        user.firstName! + " " + user.lastName!,
                        style: TextStyle(color: kTextColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        user.phone!,
                        style: TextStyle(color: kTextColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        user.email!,
                        style: TextStyle(color: kTextColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender: ",
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        user.gender!.name,
                        style: TextStyle(color: kTextColor, fontSize: 20),
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
