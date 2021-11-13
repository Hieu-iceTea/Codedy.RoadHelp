import 'package:flutter/material.dart';

import '/config/size_config.dart';
import '/models/user.dart';
import 'components/body.dart';
import 'components/confirn_bottom_navigation_bar.dart';
import 'components/custom_app_bar.dart';

class UserDetailsScreen extends StatelessWidget {
  static String routeName = "/user_details";

  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final UserDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as UserDetailsArguments;

    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(user: arguments.user),
      bottomNavigationBar: ConfirnBottomNavigationBar(
        onConfirm: arguments.onConfirm,
        onCancel: arguments.onCancel,
      ),
    );
  }
}

class UserDetailsArguments {
  final User user;
  final Function onConfirm;
  final Function? onCancel;

  UserDetailsArguments(
      {required this.user, required this.onConfirm, this.onCancel});
}
