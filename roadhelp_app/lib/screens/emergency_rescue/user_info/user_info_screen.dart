import 'package:flutter/material.dart';
import 'package:roadhelp/helper/util.dart';

import '/config/size_config.dart';
import '/models/user.dart';
import 'components/body.dart';
import 'components/confirn_bottom_navigation_bar.dart';
import 'components/custom_app_bar.dart';

class UserInfoScreen extends StatelessWidget {
  static String routeName = "/user_info";

  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final UserInfoArguments arguments =
        ModalRoute.of(context)!.settings.arguments as UserInfoArguments;

    return WillPopScope(
      onWillPop: () async {
        bool confirm = await Util.confirmDialog(
          context: context,
          content: "Bạn muốn hủy gọi cứu hộ khẩn lần này?",
        );
        if (confirm) {
          return arguments.onCancel();
        }

        return false;
      },
      child: Scaffold(
        //backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(onCancel: arguments.onCancel),
        ),
        body: Body(user: arguments.user),
        bottomNavigationBar:
            ConfirnBottomNavigationBar(onConfirm: arguments.onConfirm),
      ),
    );
  }
}

class UserInfoArguments {
  final User user;
  final Function onConfirm;
  final Future<bool> Function() onCancel;

  UserInfoArguments(
      {required this.user, required this.onConfirm, required this.onCancel});
}
