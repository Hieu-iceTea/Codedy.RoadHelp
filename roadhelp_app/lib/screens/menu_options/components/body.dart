import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/auth/sign_in/sign_in_screen.dart';
import 'package:roadhelp/screens/my_account/become_to_partner/become_to_partner_screen.dart';
import 'package:roadhelp/screens/my_account/my_account/my_account_screen.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage/repair_place_manage_screen.dart';

import 'menu_item.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(imageUrl: authProvider.item.currentUser?.imageUrl),
            SizedBox(height: 20),
            MenuItem(
              text: "Tài Khoản Của Tôi",
              icon: "assets/icons/User Icon.svg",
              press: () =>
                  Navigator.pushNamed(context, MyAccountScreen.routeName),
            ),
            if (authProvider.item.currentUser!
                .hasAuthority(AuthorityRole.member.key))
              MenuItem(
                text: "Trở Thành Đối Tác",
                icon: "assets/icons/Flash Icon.svg",
                press: () => Navigator.pushNamed(
                    context, BecomeToPartnerScreen.routeName),
              ),
            if (authProvider.item.currentUser!
                .hasAuthority(AuthorityRole.partner.key))
              MenuItem(
                text: "Quản Lý Tiệm Sửa Xe",
                icon: "assets/icons/Shop Icon.svg",
                press: () => Navigator.pushNamed(
                    context, RepairPlaceManageScreen.routeName),
              ),
            /*MenuItem(
              text: "Thông Báo",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),*/
            MenuItem(
              text: "Cài Đặt",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            MenuItem(
              text: "Trung Tâm Trợ Giúp",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            MenuItem(
              text: "Đăng Xuất",
              icon: "assets/icons/Log out.svg",
              press: () {
                //Navigator.pushNamed(context, SignInScreen.routeName);

                Provider.of<AuthProvider>(context, listen: false).logout();

                //Remove all routes:
                //https://stackoverflow.com/questions/45889341/flutter-remove-all-routes
                Navigator.pushNamedAndRemoveUntil(context,
                    SignInScreen.routeName, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
