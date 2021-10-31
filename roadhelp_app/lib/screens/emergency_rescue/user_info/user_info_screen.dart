import 'package:flutter/material.dart';

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

    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(user: arguments.user),
      bottomNavigationBar: ConfirnBottomNavigationBar(),
    );
  }
}

class UserInfoArguments {
  final User user;

  UserInfoArguments({required this.user});
}
