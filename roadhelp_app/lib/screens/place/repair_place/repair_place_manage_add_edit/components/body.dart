import 'package:flutter/material.dart';

import '/config/constants.dart';
import '/config/size_config.dart';
import 'repair_place_form.dart';

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
                Text(
                  "Vui vòng nhập đầy đủ các thông tin dưới đây\nđể thêm mới tiệm sửa xe của bạn",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                RepairPlaceForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Mọi thay đổi của bạn sẽ được quản trị viên kiểm duyệt\ntrước khi nó xuất hiện công khai.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
