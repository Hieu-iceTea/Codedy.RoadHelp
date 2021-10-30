import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text(
              "Chỉ một lát thôi...\nHệ thống đang tìm người hỗ trợ bạn.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
