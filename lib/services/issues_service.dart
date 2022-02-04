import 'dart:convert';
import 'package:fetch_github_api_getx/models/issues_model.dart';
import 'package:http/http.dart' as http;

class IssuesService {
  Future<List<IssuesModel>> fetchIssues(issue) async {
    var url = 'https://api.github.com/search/issues?q=$issue';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List dataResponse = jsonDecode(response.body)['items'];
      var issues = <IssuesModel>[];

      dataResponse.forEach((element) {
        issues.add(IssuesModel.fromJson(element));
      });

      return issues;
    } else {
      throw Exception('Gagal Get Issues!');
    }
  }
}
