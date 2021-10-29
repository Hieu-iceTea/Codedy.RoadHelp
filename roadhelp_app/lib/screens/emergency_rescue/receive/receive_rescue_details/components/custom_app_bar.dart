import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage_image/repair_place_manage_image_screen.dart';

class CustomAppBar extends StatelessWidget {
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
            Container(
              margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  RepairPlaceManageImageScreen.routeName,
                  //arguments: RepairPlaceManageImageArguments(garage: garage),
                ),
                icon: const Icon(Icons.map),
                tooltip: "Xem trên bản đồ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
