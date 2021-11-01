import 'package:flutter/material.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/screens/emergency_rescue/issue_details/issue_details_screen.dart';

class IssueListItem extends StatelessWidget {
  const IssueListItem({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issues issue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        IssueDetailsScreen.routeName,
        arguments: IssueDetailsArguments(issue: issue, isPartner: true),
      ),
      leading: Hero(
        tag: issue.id.toString(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: issue.userMember?.imageUrl != null
              ? AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    issue.userMember!.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                )
              : const Text("No\nImage", textAlign: TextAlign.center),
        ),
      ),
      title: Text(issue.category!.name),
      subtitle: Column(
        children: [
          if (issue.description != null && issue.description!.isNotEmpty)
            Text(
              issue.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                size: 16,
                color: Colors.black45,
              ),
              Text(
                issue.address!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
