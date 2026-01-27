import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RewardTimeService {
  String baseUrl = "http://10.81.76.16:3000/user/rewardtime";

  Future<Map<String, String>> getHeaderRt() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');

    print("Token from rewardtime_integrate.dart: $token");

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  Future<int> getRewardTimeUser() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
        headers: await getHeaderRt(),
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        return user["rewardTime"] as int;
      }
    } on Exception catch (e) {
      print(e);
    }
    return -1;
  }

  Future<int> setRewardTimeUser(int newRewardTime) async {
    try {
      var response = await http.patch(
        Uri.parse(baseUrl),
        headers: await getHeaderRt(),
        body: jsonEncode({"rewardTime": newRewardTime}),
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        return user["rewardTime"] as int;
      }
    } on Exception catch (e) {
      print(e);
    }
    return -1;
  }

  Future<int> incrementRewardTimeUser() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
        headers: await getHeaderRt(),
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        final newValue = user["rewardTime"] + 10;
        await setRewardTimeUser(newValue);
        return newValue;
      }
    } on Exception catch (e) {
      print(e);
      return -1;
    }
    return -1;
  }

  Future<void> completeToDo({required String id}) async {
    var response = await http.patch(
      Uri.parse("$baseUrl/$id/complete"),
      headers: await getHeaderRt(),
      body: jsonEncode({"taskDone": true}),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
