import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDoService {
  String baseUrl = "http://localhost:3000/todo";

  Future<List> getToDo() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        jsonDecode(response.body);
      }
    } on Exception catch (e) {
      print(e);
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
