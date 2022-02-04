import 'dart:convert';

import 'package:fetch_github_api_getx/models/repository_model.dart';
import 'package:http/http.dart' as http;

class RepositoryService {
  Future<List<RepositoryModel>> fetchRepository(repositories) async {
    var url = 'https://api.github.com/search/repositories?q=$repositories';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List dataResponse = jsonDecode(response.body)['items'];
      var repository = <RepositoryModel>[];

      dataResponse.forEach((element) {
        repository.add(RepositoryModel.fromJson(element));
      });
      return repository;
    } else {
      throw Exception('Gagal Get Repository');
    }
  }
}
