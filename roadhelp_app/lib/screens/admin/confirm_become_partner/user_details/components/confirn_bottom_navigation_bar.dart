import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';

import '/components/default_button.dart';

class ConfirnBottomNavigationBar extends StatelessWidget {
  final Function onConfirm;
  final Function? onCancel;

  const ConfirnBottomNavigationBar({
    required this.onConfirm,
    this.onCancel,
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
        color: const Color(0xFFF5F6F9),
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
              press: onConfirm,
            ),
            if (onCancel != null)
              SizedBox(height: getProportionateScreenHeight(15)),
            if (onCancel != null)
              DefaultButton(
                text: "Từ chối",
                press: onCancel,
              ),
          ],
        ),
      ),
    );
  }
}
