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

  static Widget showWidgetNotification(
      {String? title, String? content, bool isError = false}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isError == true ? Icons.error_outline : Icons.info_outline,
            color: isError == true ? Colors.red : Colors.blue,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
              title ??
                  (isError == true ? 'An error occurred!' : "Notification!"),
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
                content ?? (isError == true ? 'Something went wrong.' : "...")),
          )
        ],
      ),
    );
  }
}
