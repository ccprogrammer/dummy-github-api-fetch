import 'package:fetch_github_api_getx/models/list_user_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final ListUserModel user;
  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(user.avatarUrl),
      title: Text(user.login),
      trailing: Text(user.id.toString()),
    );
  }
}
