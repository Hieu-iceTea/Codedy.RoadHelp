import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '/config/constants.dart';
import '/helper/util.dart';

class WaitWebSocket extends StatefulWidget {
  String message;
  String destination;
  Function(StompFrame) callback;

  WaitWebSocket({
    required this.message,
    required this.destination,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<WaitWebSocket> createState() => _WaitWebSocketState();
}

class _WaitWebSocketState extends State<WaitWebSocket> {
  // use this if you are using emulator. localhost is mapped to 10.0.2.2 by default.
  final String socketUrl = baseApiUrl + 'webSocket';

  StompClient? stompClient;

  @override
  void initState() {
    if (stompClient == null) {
      stompClient = StompClient(
        config: StompConfig.SockJS(
          url: socketUrl,
          onConnect: _onConnectCallback,
          onWebSocketError: (dynamic error) async => {
            await Util.showDialogNotification(
                context: context, content: error.toString())
          },
        ),
      );

      stompClient!.activate();
    }

    super.initState();
  }

  @override
  void dispose() {
    if (stompClient != null) {
      stompClient!.deactivate();
    }

    super.dispose();
  }

  void _onConnectCallback(StompFrame connectFrame) {
    // client is connected and ready

    stompClient!.subscribe(
      destination: widget.destination,
      callback: widget.callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 50),
          Text(
            widget.message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
