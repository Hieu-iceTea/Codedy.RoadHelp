import 'package:flutter/material.dart';

class UserImage extends StatefulWidget {
  const UserImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
          ? CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  widget.imageUrl!,
                ),
              ),
            )
          : const Center(child: Text("No Image")),
    );
  }
}
