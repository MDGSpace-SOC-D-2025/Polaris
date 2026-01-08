import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDoService {
  String baseUrl = "http://10.90.222.252:3000/todo";

  Future<List> getToDo() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }

    return [];
  }

  Future<void> addToDo({required String taskName}) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"taskName": taskName, "taskDone": false}),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
