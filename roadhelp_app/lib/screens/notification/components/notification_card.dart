import 'package:flutter/material.dart';

import '/models/notification_model.dart';
import '../../../config/constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/placeholder_processing.gif",
                image: notification.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title!,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                notification.content!,
                style: const TextStyle(
                  //fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
