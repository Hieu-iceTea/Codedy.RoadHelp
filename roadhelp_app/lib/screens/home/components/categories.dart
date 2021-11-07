import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/screens/emergency_rescue/receive/receive_rescue/receive_rescue_screen.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue/send_rescue_screen.dart';
import 'package:roadhelp/screens/place/gas_place/gas_place_screen.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/repair_place_screen.dart';

import '../../../config/size_config.dart';

class Categories extends StatelessWidget {
  User? currentUser;

  Categories({
    required this.currentUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Shop Icon.svg",
        "text": "Tiệm Sửa Xe",
        "routeName": RepairPlaceScreen.routeName,
      },
      {
        "icon": "assets/icons/Flash Icon.svg",
        "text": "Cứu Hộ Khẩn",
        "routeName": SendRescueScreen.routeName,
      },
      if (currentUser != null &&
          currentUser!.hasAuthority(AuthorityRole.partner.key))
        {
          "icon": "assets/icons/Cash.svg",
          "text": "Nhận Cứu Hộ",
          "routeName": ReceiveRescueScreen.routeName,
        },
      {
        "icon": "assets/icons/Bill Icon.svg",
        "text": "Cây Xăng",
        "routeName": GasPlaceScreen.routeName,
      },
      if (currentUser != null &&
          !currentUser!.hasAuthority(AuthorityRole.partner.key))
        {
          "icon": "assets/icons/Question mark.svg",
          "text": "Hỗ Trợ K.Hàng",
          "routeName": null,
        },
      {
        "icon": "assets/icons/Discover.svg",
        "text": "Xem Thêm",
        "routeName": null,
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.pushNamed(context, categories[index]["routeName"]!);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
