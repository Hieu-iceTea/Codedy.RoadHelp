import 'package:flutter/material.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issues.dart';

class IssueDescription extends StatelessWidget {
  const IssueDescription({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issues issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            issue.category!.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(64),
              bottom: getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    issue.userMember!.firstName! +
                        " " +
                        issue.userMember!.lastName!,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    issue.phone!,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text(
                    issue.address!,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text(
                    issue.description!,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              ],
            )),
        /*Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Chi tiết:"),
              Row(
                children: [
                  const SizedBox(width: 60),
                  Expanded(
                    child: Text(
                      issue.description!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),*/
      ],
    );
  }
}
