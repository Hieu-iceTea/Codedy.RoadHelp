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
}
