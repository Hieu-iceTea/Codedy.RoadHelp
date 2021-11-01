import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/issue.dart';

class IssueRating extends StatelessWidget {
  const IssueRating({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "Đánh giá",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        issue.ratingIssue != null
            ? ListTile(
                leading:
                    Image.network(issue.ratingIssue!.userMember!.imageUrl!),
                title: Text(
                  issue.ratingIssue!.userMember!.firstName! +
                      " " +
                      issue.ratingIssue!.userMember!.lastName!,
                  maxLines: 1,
                ),
                subtitle: Text(getRate(issue.ratingIssue!.ratePoint!) +
                    "\n" +
                    issue.ratingIssue!.comment!),
                trailing: RoundedIconBtn(
                  icon: Icons.thumb_up,
                  press: () {},
                ),
                isThreeLine: true,
              )
            : const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Chưa có đánh giá về sự cố này."),
              ),
      ],
    );
  }

  String getRate(int rate) {
    String result = "";

    for (int i = 0; i < rate; i++) {
      result += "⭐";
    }

    result += " (" + rate.toString() + ")";

    return result;
  }
}
