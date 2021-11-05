import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountPic extends StatelessWidget {
  String? imageUrl;

  MyAccountPic({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          imageUrl != null
              ? CircleAvatar(
            backgroundImage: NetworkImage(imageUrl!),
          )
              : const CircleAvatar(
            backgroundImage:
            AssetImage("assets/images/Profile Image.png"),
          ),
        ],
      ),
    );
  }
}
