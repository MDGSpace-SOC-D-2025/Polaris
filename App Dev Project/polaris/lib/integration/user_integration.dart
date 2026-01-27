import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  String baseUrl = "http://10.81.76.16:3000/user/register";
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
        final user = jsonDecode(response.body);
        String token = user["token"];
        print("Token from login_integrate.dart: $token");

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
      } else {
        print("unsuccessful ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
