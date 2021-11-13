import 'package:flutter/material.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/user.dart';

class UserDescription extends StatelessWidget {
  const UserDescription({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Center(
          child: Text(
            user.firstName! + " " + user.lastName!,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        const Center(
          child: Text(
            "Muốn trở thành đối tác của bạn",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(10),
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
                      "Tài khoản:",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      user.username!,
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      user.email!,
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Điện thoại:",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      user.phone!,
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Địa chỉ:",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      user.address!,
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 0,
          ),
          child: Center(
            child: Text(
              "Sau khi bạn xác nhận, tài khoản '${user.username}' có thể truy cập tất cả tính năng của đối tác.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
