import 'dart:convert';
import 'package:http/http.dart';
import 'package:riverpod_practice/model/user.dart';

class ApiServices {
  String endpoint = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    Response response = await get(
      Uri.parse(endpoint),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // debugPrint(result);
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<User> getUserById(int id) async {
    Response response = await get(
      Uri.parse("$endpoint/$id"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      // debugPrint(result);
      return User.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
