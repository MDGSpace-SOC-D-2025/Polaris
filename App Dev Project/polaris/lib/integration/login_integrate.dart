import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  String baseUrl = "http://10.61.61.181:3000/user/login";

  Future<bool> loginUserList({
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
        final user = jsonDecode(response.body);
        String token = user["token"];
        print("Token from login_integrate.dart: $token");

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        return true;
      } else {
        print("unsuccessful ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e);
    }

    return false;
  }
}
