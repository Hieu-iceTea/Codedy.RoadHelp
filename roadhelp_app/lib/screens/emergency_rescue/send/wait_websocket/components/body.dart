import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '/screens/emergency_rescue/send/wait_websocket/components/wait_websocket.dart';

class Body extends StatelessWidget {
  String message;
  String destination;
  Function(StompFrame) callback;

  Body({
    required this.message,
    required this.destination,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WaitWebSocket(
        message: message,
        destination: destination,
        callback: callback,
      ),
    );
  }
}
