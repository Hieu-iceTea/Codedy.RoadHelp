import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/issue.dart';
import 'package:roadhelp/providers/issue_provider.dart';

import '/config/size_config.dart';
import '../receive_rescue_screen.dart';
import 'issue_list_item.dart';

class Body extends StatefulWidget {
  IssueListScreenState issueListScreenState;

  Body({
    required this.issueListScreenState,
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Issue>> _fetchAllData(BuildContext context) async {
    if (widget.issueListScreenState == IssueListScreenState.receiveNew) {
      return await Provider.of<IssueProvider>(context, listen: false)
          .fetchAllDataByStatusSent();
    }

    if (widget.issueListScreenState == IssueListScreenState.historySent) {
      return await Provider.of<IssueProvider>(context, listen: false)
          .fetchAllDataByUserMember();
    }

    if (widget.issueListScreenState == IssueListScreenState.historyReceived) {
      return await Provider.of<IssueProvider>(context, listen: false)
          .fetchAllDataByUserPartner();
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Issue>>(
        future: _fetchAllData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => _fetchAllData(context),
              child: Consumer<IssueProvider>(
                builder: (context, value, child) => ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  itemCount: value.items.length,
                  itemBuilder: (ctx, index) => IssueListItem(
                    issue: value.items[index],
                    isPartnerReceiveNew: widget.issueListScreenState ==
                        IssueListScreenState.receiveNew,
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
