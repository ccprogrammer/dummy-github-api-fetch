import 'package:fetch_github_api_getx/models/issues_model.dart';
import 'package:flutter/material.dart';

class IssuesTile extends StatelessWidget {
  final IssuesModel issues;
  IssuesTile(this.issues);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(issues.avatarUrl),
      title: Text(issues.title),
      subtitle: Text(issues.updatedAt),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(issues.state),
        ],
      ),
    );
  }
}
