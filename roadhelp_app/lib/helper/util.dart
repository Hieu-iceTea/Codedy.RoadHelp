import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util {
  static Future<void> showDialogNotification(
      {required BuildContext context, String? title, String? content}) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title ?? 'An error occurred!'),
        content: Text(content ?? 'Something went wrong.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  static Widget showWidgetError({String? title, String? content}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
              title ?? 'An error occurred!',
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(content ?? 'Something went wrong.'),
          )
        ],
      ),
    );
  }
}
