import 'dart:convert';
import 'package:fetch_github_api_getx/models/list_user_model.dart';
import 'package:http/http.dart' as http;

class ListUserService {
  Future<List<ListUserModel>> fetchListUser(user) async {
    var url = 'https://api.github.com/search/users?q=$user';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List dataResponse = jsonDecode(response.body)['items'];
      var users = <ListUserModel>[];

      dataResponse.forEach((user) {
        users.add(ListUserModel.fromJson(user));
      });

      // Menggunakan for biasa
      // for (var user in dataResponse) {
      //   users.add(ListUserModel.fromJson(user));
      // }

      return users;
    } else {
      throw Exception('Gagal Get User!');
    }
  }
}
