import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  String baseUrl = "http://localhost:3000/user/login";
  Future<void> loginUserList({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        jsonDecode(response.body);
      } else {
        print("unsuccessful ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
