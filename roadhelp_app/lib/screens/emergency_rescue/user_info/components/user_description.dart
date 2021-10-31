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
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(64),
            bottom: getProportionateScreenWidth(10),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  user.phone!,
                  style: TextStyle(color: kTextColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text(
                  user.address! + " | 2 Km",
                  style: TextStyle(color: kTextColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text(
                  "15 phút di chuyển",
                  style: TextStyle(color: kTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
