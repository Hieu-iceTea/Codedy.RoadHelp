import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import '/components/default_button.dart';

class ConfirnBottomNavigationBar extends StatelessWidget {
  const ConfirnBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: SizeConfig.screenWidth * 0.15,
        //horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(15)),
            DefaultButton(
              text: "Xác nhận",
              press: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            DefaultButton(
              text: "Hủy",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
