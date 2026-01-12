import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDoService {
  String baseUrl = "http://localhost:3000/todo";

  Future<List<dynamic>> getToDo() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List;
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

  Future<void> deleteToDo({required String id}) async {
    var response = await http.delete(Uri.parse("${baseUrl}/${id}"));

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
