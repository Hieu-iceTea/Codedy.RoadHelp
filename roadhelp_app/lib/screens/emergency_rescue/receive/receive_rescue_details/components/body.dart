import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import '/components/default_button.dart';
import 'issue_description.dart';
import 'slider_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Issues issue;

  const Body({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GarageProvider>(
      builder: (context, value, child) => ListView(
        children: [
          SliderImages(issue: issue),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                IssueDescription(
                  issue: issue,
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      right: SizeConfig.screenWidth * 0.15,
                      bottom: getProportionateScreenWidth(40),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: DefaultButton(
                      text: "View on map",
                      press: () {},
                    ),
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
