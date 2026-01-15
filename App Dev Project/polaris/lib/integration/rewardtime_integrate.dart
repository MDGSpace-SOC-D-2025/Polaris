import 'dart:convert';
import 'package:http/http.dart' as http;

class RewardTimeService {
  String baseUrl = "http://10.81.68.170:3000/user/rewardtime";

  Future<int> getRewardTimeUser() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
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
        headers: {"Content-Type": "application/json"},
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
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        return (user["rewardTime"] + 10) as int;
      }
    } on Exception catch (e) {
      print(e);
      return -1;
    }
    return -1;
  }
}
