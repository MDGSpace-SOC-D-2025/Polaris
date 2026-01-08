import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = "http://10.90.222.252:3000/user/register";
  Future<void> registerUserList({
    required String email,
    required String userId,
    required String password,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "userId": userId,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
