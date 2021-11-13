import 'package:flutter/material.dart';

import '/config/size_config.dart';
import '/helper/util.dart';
import '/models/user.dart';
import '/repositories/auth_repository.dart';
import '/screens/admin/confirm_become_partner/user_request_become_partner/components/user_item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<User> _users = [];

  Future<List<User>> _fetchAllData(BuildContext context) async {
    _users = await AuthRepository.findAllUserRequestBecomePartner();

    //Dùng các cách này sẽ lỗi. xem thêm: https://stackoverflow.com/questions/61175917/setstate-callback-argument-returned-a-future-in-flutter
    /*setState(() {
      _users = await AuthRepository.findAllUserRequestBecomePartner();
    });*/

    //setState(() {});

    return _users;
  }

  Future<void> _reloadAllData() async {
    //Dùng tạm cách này - nó call API 2 lần chưa rõ nguyên nhân
    setState(() {
      _fetchAllData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _fetchAllData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => _reloadAllData(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                itemCount: _users.length,
                itemBuilder: (ctx, index) => UserItem(
                  user: _users[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          } else if (snapshot.hasError) {
            return Util.showWidgetNotification(
              content: snapshot.error.toString(),
              isError: true,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
