import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ToDoService {
  String baseUrl = "http://10.81.69.149:3000/todo";

  Future<Map<String, String>> getHeader() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');

    print("Token from todo_integrate.dart: $token");

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  Future<List<dynamic>> getToDo() async {
    var response = await http.get(
      Uri.parse(baseUrl),
      headers: await getHeader(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List;
    }

    return [];
  }

  Future<void> addToDo({required String taskName}) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: await getHeader(),
      body: jsonEncode({"taskName": taskName, "taskDone": false}),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }

  Future<void> deleteToDo({required String id}) async {
    var response = await http.delete(
      Uri.parse("$baseUrl/$id"),
      headers: await getHeader(),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
