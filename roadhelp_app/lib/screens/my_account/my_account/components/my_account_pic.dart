import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountPic extends StatelessWidget {
  const MyAccountPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
        ],
      ),
    );
  }
}
