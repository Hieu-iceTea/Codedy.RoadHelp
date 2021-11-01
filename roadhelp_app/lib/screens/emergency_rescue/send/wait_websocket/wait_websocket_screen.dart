import 'package:flutter/material.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class WaitWebSocketScreen extends StatelessWidget {
  static String routeName = "/wait_websocket";

  const WaitWebSocketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaitWebSocketArguments arguments =
        ModalRoute.of(context)!.settings.arguments as WaitWebSocketArguments;

    return WillPopScope(
      onWillPop: () async {
        bool confirm = await Util.confirmDialog(
          context: context,
          content: "Bạn muốn hủy cứu hộ này?",
        );
        if (confirm) {
          arguments.onCancel();
          return true;
        }

        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(onCancel: arguments.onCancel),
        ),
        body: Body(
          message: arguments.message,
          destination: arguments.destination,
          callback: arguments.callback,
        ),
      ),
    );
  }
}

class WaitWebSocketArguments {
  String message;
  String destination;
  Function(StompFrame) callback;

  final Function onCancel;

  WaitWebSocketArguments({
    required this.message,
    required this.destination,
    required this.callback,
    required this.onCancel,
  });
}
