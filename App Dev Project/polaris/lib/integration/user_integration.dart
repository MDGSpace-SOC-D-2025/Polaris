import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = "http://10.81.66.249:3000/user/register";
  Future<void> registerUserList({
    required String email,
    required String userId,
    required String password,
  }) async {
    try {
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
      } else {
        print("unsuccessful ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
