import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/providers/issue_provider.dart';

import 'components/body.dart';

enum IssueListScreenState { receiveNew, historySent, historyReceived }

class ReceiveRescueScreen extends StatefulWidget {
  static String routeName = "/receive_rescue";

  ReceiveRescueScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiveRescueScreen> createState() => _ReceiveRescueScreenState();
}

class _ReceiveRescueScreenState extends State<ReceiveRescueScreen> {
  IssueListScreenState _issueListScreenState = IssueListScreenState.receiveNew;
  bool isFirstLoad = true;

  @override
  Widget build(BuildContext context) {
    if (isFirstLoad && ModalRoute.of(context)!.settings.arguments != null) {
      final ReceiveRescueArguments arguments =
          ModalRoute.of(context)!.settings.arguments as ReceiveRescueArguments;

      _issueListScreenState = arguments.issueListScreenState;

      isFirstLoad = false;
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        issueListScreenState: _issueListScreenState,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _issueListScreenState == IssueListScreenState.receiveNew
                ? "Nhận cứu hộ khẩn cấp"
                : _issueListScreenState == IssueListScreenState.historyReceived
                    ? "Lịch sử nhận cứu hộ"
                    : "Lịch sử gửi cứu hộ",
            style: TextStyle(color: Colors.black),
          ),
          Consumer<IssueProvider>(
            builder: (context, value, child) => Text(
              _issueListScreenState == IssueListScreenState.receiveNew
                  ? "${value.items.length} người gần bạn đang cần bạn hỗ trợ"
                  : "${value.items.length} mục",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
      actions: [
        Consumer<AuthProvider>(
          builder: (context, authProvider, child) => PopupMenuButton(
            itemBuilder: (context) => [
              if (authProvider.authData.currentUser != null &&
                  authProvider.authData.currentUser!
                      .hasAuthority(AuthorityRole.partner.key))
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.call_received, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Nhận cứu hộ mới'),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _issueListScreenState = IssueListScreenState.receiveNew;
                    });
                  },
                ),
              if (authProvider.authData.currentUser != null &&
                  authProvider.authData.currentUser!
                      .hasAuthority(AuthorityRole.partner.key))
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.update, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Lịch sử nhận'),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _issueListScreenState =
                          IssueListScreenState.historyReceived;
                    });
                  },
                ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.history, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Lịch sử gửi'),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _issueListScreenState = IssueListScreenState.historySent;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ReceiveRescueArguments {
  IssueListScreenState issueListScreenState;

  ReceiveRescueArguments({required this.issueListScreenState});
}
