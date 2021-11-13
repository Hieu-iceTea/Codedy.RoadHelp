import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import 'top_rounded_container.dart';
import 'user_description.dart';
import 'user_image.dart';

class Body extends StatelessWidget {
  final User user;

  const Body({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GarageProvider>(
      builder: (context, value, child) => ListView(
        children: [
          Container(
            color: const Color(0xFFF5F6F9),
            child: Column(
              children: [
                const SizedBox(height: 25),
                UserImage(imageUrl: user.imageUrl),
                const SizedBox(height: 25),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      UserDescription(
                        user: user,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
