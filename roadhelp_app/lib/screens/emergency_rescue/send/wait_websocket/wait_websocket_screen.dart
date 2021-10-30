import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'components/body.dart';

class WaitWebSocketScreen extends StatelessWidget {
  static String routeName = "/wait_websocket";

  const WaitWebSocketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaitWebSocketArguments arguments =
        ModalRoute.of(context)!.settings.arguments as WaitWebSocketArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chỉ một lúc thôi..."),
      ),
      body: Body(
        message: arguments.message,
        destination: arguments.destination,
        callback: arguments.callback,
      ),
    );
  }
}

class WaitWebSocketArguments {
  String message;
  String destination;
  Function(StompFrame) callback;

  WaitWebSocketArguments({
    required this.message,
    required this.destination,
    required this.callback,
  });
}
