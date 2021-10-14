import 'package:flutter/material.dart';
import '../../../../config/size_config.dart';
import '../../../../config/constants.dart';

import 'become_to_partner_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Đăng kí đối tác", style: headingStyle),
                Text(
                  "Bạn vui lòng nhập đầy đủ và xác nhận lại thông tin \n để đăng kí làm đối tác !",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                BeComeToPartnerForm(),
                SizedBox(height: getProportionateScreenHeight(30)),

              ],
            ),
          ),
        ),
      ),
    );
  }

}

