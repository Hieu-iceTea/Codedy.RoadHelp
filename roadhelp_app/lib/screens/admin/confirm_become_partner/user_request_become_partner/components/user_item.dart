import 'package:flutter/material.dart';
import 'package:roadhelp/models/user.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      leading: Hero(
        tag: user.id.toString(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: user.imageUrl != null
              ? AspectRatio(
                  aspectRatio: 1 / 1,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/placeholder_processing.gif",
                    image: user.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                )
              : const Text("No\nImage", textAlign: TextAlign.center),
        ),
      ),
      title: Text(user.firstName! + " " + user.lastName!),
      subtitle: Text(user.username!),
    );
  }
}
