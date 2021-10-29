import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/providers/issues_provider.dart';
import 'package:roadhelp/screens/emergency_rescue/receive/receive_rescue_details/components/map_image.dart';

import '/components/default_button.dart';
import 'issue_description.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Issues issue;

  const Body({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IssuesProvider>(
      builder: (context, value, child) => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            title: const Text(
              "Chi tiết sự cố",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.map),
                  tooltip: "Xem bản đồ",
                ),
              )
            ],
            //foregroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: MapImages(
                latitude: issue.latitude,
                longitude: issue.longitude,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      IssueDescription(
                        issue: issue,
                      ),
                      TopRoundedContainer(
                        color: const Color(0xFFF6F7F9),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Tôi muốn đi hỗ trợ",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          )
        ],
        //child: Body(issue: arguments.issue),
      ),
    );
  }
}
