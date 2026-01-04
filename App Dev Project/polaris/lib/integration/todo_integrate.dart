import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDoService {
  String baseUrl = "http://localhost:3000/todo";
  Future<List> getToDoList() async {
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return [];
  }
}
