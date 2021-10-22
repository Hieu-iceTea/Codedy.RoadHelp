import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '/components/default_button.dart';
import '/screens/home/home_screen.dart';
import '../../../../config/size_config.dart';

import 'components/body.dart';

class PartnerSuccessScreen extends StatefulWidget {
  static String routeName = "/partner_success";

  final String? titleText;
  final String? titleContent;
  final String? screen;

  PartnerSuccessScreen(this.titleText, this.titleContent, this.screen);

  @override
  _PartnerSuccessScreen createState() => _PartnerSuccessScreen();
}


class _PartnerSuccessScreen extends State<PartnerSuccessScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: Text("Login Success"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Image.asset(
              "assets/images/complete.jpg",
              height: SizeConfig.screenHeight * 0.2, //40%
              width: SizeConfig.screenWidth * 1,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              //"Gửi Yêu Cầu Thành Công",
              "${widget.titleText}",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              //"Yêu cầu nâng cấp tài khoản của bạn đã được \n ghi nhận tại hệ thống. Bạn vui lòng đợi \n Admin kiểm duyệt nhé!!",
              "${widget.titleContent}",
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "Hoàn Thành",
                press: () {
                  Navigator.pushNamed(context,  "${widget.screen}");
                },
              ),
            ),
            Spacer(),
          ],
        )
    );
  }
}


