import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/issue.dart';
import 'package:roadhelp/models/rating_issue.dart';
import 'package:roadhelp/repositories/rating_issue_repository.dart';

class IssueRating extends StatelessWidget {
  const IssueRating({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issue issue;

  Future<RatingIssue?> _fetchData(BuildContext context) async {
    return await RatingIssueRepository.findByIssueId(issueId: issue.id!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RatingIssue?>(
        future: _fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Util.showWidgetNotification(
              content: snapshot.error.toString(),
              isError: true,
            );
          } else if (snapshot.connectionState != ConnectionState.waiting) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Text(
                    "Đánh giá",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                snapshot.data != null
                    ? ListTile(
                        leading:
                            Image.network(snapshot.data!.userMember!.imageUrl!),
                        title: Text(
                          snapshot.data!.userMember!.firstName! +
                              " " +
                              snapshot.data!.userMember!.lastName!,
                          maxLines: 1,
                        ),
                        subtitle: Text(getRate(snapshot.data!.ratePoint!) +
                            "\n" +
                            snapshot.data!.comment!),
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
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
