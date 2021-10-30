import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/providers/garage_provider.dart';
import 'package:roadhelp/providers/issues_provider.dart';

import '/config/size_config.dart';
import 'issue_list_item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Issues>> _fetchAllData(BuildContext context) async {
    return await Provider.of<IssuesProvider>(context, listen: false)
        .fetchAllDataByStatusSent();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Issues>>(
        future: _fetchAllData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => _fetchAllData(context),
              child: Consumer<IssuesProvider>(
                builder: (context, value, child) => ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  itemCount: value.items.length,
                  itemBuilder: (ctx, index) => IssueListItem(
                    issue: value.items[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                ),
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
