import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';

class SliderImages extends StatefulWidget {
  const SliderImages({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issues issue;

  @override
  _SliderImagesState createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.issue.id.toString(),
              child: widget.issue.userMember?.imageUrl != null
                  ? Image.network(widget.issue.userMember!.imageUrl!)
                  : const Center(child: Text("No Image")),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
      ],
    );
  }
}
