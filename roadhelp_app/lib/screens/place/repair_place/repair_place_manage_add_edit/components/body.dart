import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';

import '/config/size_config.dart';
import 'repair_place_form.dart';

class Body extends StatelessWidget {
  final Garage? garage;

  const Body({Key? key, this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String modeStr = garage == null ? "Thêm mới" : "Cập nhật";

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
                  "Vui vòng nhập đầy đủ các thông tin dưới đây\nđể " +
                      modeStr.toLowerCase() +
                      " tiệm sửa xe của bạn",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                RepairPlaceForm(garage: garage),
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
