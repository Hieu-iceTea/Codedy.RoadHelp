import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;

  const ImageItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: -15,
            right: -15,
            child: RoundedIconBtn(
              icon: Icons.cancel,
              press: () {},
              showShadow: true,
            )),
      ],
    );
  }
}
