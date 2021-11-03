import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/url_launcher_helper.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/issue.dart';

class IssueDescription extends StatelessWidget {
  final Issue issue;
  bool isPartner;

  IssueDescription({
    Key? key,
    required this.issue,
    this.isPartner = false,
  }) : super(key: key);

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
              right: getProportionateScreenWidth(10),
              bottom: getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Người gặp nạn:",
                        style: TextStyle(
                          color: kTextColor.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        issue.userMember!.firstName! +
                            " " +
                            issue.userMember!.lastName!,
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
                if (issue.userPartner != null)
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Người giúp đỡ:",
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.8),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          issue.userPartner!.firstName! +
                              " " +
                              issue.userPartner!.lastName!,
                          style: TextStyle(color: kTextColor),
                        ),
                      ],
                    ),
                  ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    (!isPartner ||
                            issue.status == IssueStatus.memberConfirmPartner ||
                            issue.status == IssueStatus.succeeded)
                        ? issue.phone!
                        : "(Nhận hỗ trợ để hiển SĐT)",
                    style: TextStyle(color: kTextColor),
                  ),
                  trailing: (isPartner &&
                          issue.status == IssueStatus.memberConfirmPartner &&
                          issue.phone != null)
                      ? RoundedIconBtn(
                          icon: Icons.phone_in_talk,
                          showShadow: true,
                          press: () {
                            try {
                              UrlLauncherHelper.launchURL(
                                  "tel:" + issue.phone!);
                            } catch (e) {
                              Util.showDialogNotification(
                                  context: context, content: e.toString());
                            }
                          },
                        )
                      : null,
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
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    issue.status!.name,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss').format(issue.createdAt!.toLocal()),
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
