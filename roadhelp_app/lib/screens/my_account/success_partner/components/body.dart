import 'package:flutter/material.dart';
import '/components/default_button.dart';
import '/screens/home/home_screen.dart';
import '../../../../config/size_config.dart';


class Body extends StatelessWidget {
 // final String  texttitle;
  //final String textcontent;


  //Body({Key? key,  required this.texttitle, required this.textcontent}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(
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
          "Gửi Yêu Cầu Thành Công",
         // (texttitle),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Yêu cầu nâng cấp tài khoản của bạn đã được \n ghi nhận tại hệ thống. Bạn vui lòng đợi \n Admin kiểm duyệt nhé!!",
          //(textcontent),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Hoàn Thành",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
