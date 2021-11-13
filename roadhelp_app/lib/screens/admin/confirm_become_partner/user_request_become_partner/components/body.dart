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
  Future<List<User>> _fetchAllData(BuildContext context) async {
    return await AuthRepository.findAllUserRequestBecomePartner();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _fetchAllData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => _fetchAllData(context),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) => UserItem(
                  user: snapshot.data![index],
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
