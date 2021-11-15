import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util {
  static Future<void> showDialogNotification(
      {required BuildContext context, String? title, String? content}) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title ?? 'Đã xảy ra lỗi!'),
        content: Text(content ?? 'Có gì đó không ổn.'),
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
                  (isError == true ? 'Đã xảy ra lỗi!' : "Notification!"),
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
                content ?? (isError == true ? 'Có gì đó không ổn.' : "...")),
          )
        ],
      ),
    );
  }

  static Future<bool> confirmDialog(
      {required BuildContext context, String? title, String? content}) async {
    bool result = false;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title ?? 'Xác nhận'),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          TextButton(
            child: const Text('Không'),
            onPressed: () {
              result = false;
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              result = true;
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );

    return result;
  }
}
