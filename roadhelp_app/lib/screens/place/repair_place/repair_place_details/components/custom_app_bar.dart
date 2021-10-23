import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage_add_edit/repair_place_manage_add_edit_screen.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage_image/repair_place_manage_image_screen.dart';

class CustomAppBar extends StatelessWidget {
  final double? rating;
  final bool isManage;
  final Garage garage;

  CustomAppBar({this.rating, this.isManage = false, required this.garage});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            if (rating != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      "$rating",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            if (isManage)
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RepairPlaceManageImageScreen.routeName,
                    arguments: RepairPlaceManageImageArguments(garage: garage),
                  ),
                  icon: const Icon(Icons.add_a_photo),
                  tooltip: "Quản lý ảnh",
                ),
              ),
            if (isManage)
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RepairPlaceManageAddEditScreen.routeName,
                    arguments:
                        RepairPlaceManageAddEditArguments(garage: garage),
                  ),
                  icon: const Icon(Icons.edit),
                  tooltip: "Chỉnh sửa tiệm sửa xe này",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
