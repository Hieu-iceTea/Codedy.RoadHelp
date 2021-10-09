import 'package:flutter/material.dart';
import 'package:roadhelp/screens/my_account/become_to_partner/become_to_partner_screen.dart';
import 'package:roadhelp/screens/my_account/my_account/my_account_screen.dart';
import 'package:roadhelp/screens/place/repair_place/partner/repair_place_manage/repair_place_manage_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Tài Khoản Của Tôi",
            icon: "assets/icons/User Icon.svg",
            press: () =>
                Navigator.pushNamed(context, MyAccountScreen.routeName),
          ),
          ProfileMenu(
            text: "Trở Thành Đối Tác",
            icon: "assets/icons/Flash Icon.svg",
            press: () =>
                Navigator.pushNamed(context, BecomeToPartnerScreen.routeName),
          ),
          ProfileMenu(
            text: "Quản Lý Tiệm Sửa Xe",
            icon: "assets/icons/Shop Icon.svg",
            press: () =>
                Navigator.pushNamed(context, RepairPlaceManageScreen.routeName),
          ),
          ProfileMenu(
            text: "Thông Báo",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài Đặt",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Trung Tâm Trợ Giúp",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng Xuất",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
