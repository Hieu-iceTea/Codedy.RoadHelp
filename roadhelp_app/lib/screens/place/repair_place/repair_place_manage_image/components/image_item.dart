import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;

  const ImageItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.network(imageUrl),
    );
  }
}
