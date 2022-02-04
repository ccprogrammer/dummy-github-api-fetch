import 'package:fetch_github_api_getx/models/repository_model.dart';
import 'package:flutter/material.dart';

class RepositoryTile extends StatelessWidget {
  final RepositoryModel repo;
  RepositoryTile(this.repo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(repo.avatarUrl),
      title: Text(repo.title),
      subtitle: Text(repo.createdAt.toString()),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${repo.watchersCount}'),
          Text('${repo.star}'),
          Text('${repo.forksCount}'),
        ],
      ),
    );
  }
}
