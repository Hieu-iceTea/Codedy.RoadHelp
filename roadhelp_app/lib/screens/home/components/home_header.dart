import 'package:flutter/material.dart';
import 'package:roadhelp/screens/notification/notification_screen.dart';

import '../../../config/size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
          SizedBox(width: 10),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 2,
            press: () =>
                Navigator.pushNamed(context, NotificationScreen.routeName),
          ),
        ],
      ),
    );
  }
}
