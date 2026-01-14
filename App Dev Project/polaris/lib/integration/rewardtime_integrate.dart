import 'dart:convert';
import 'package:http/http.dart' as http;

class RewardTimeService {
  String baseUrl = "http://localhost:3000/user/rewardtime";

  Future<int> getRewardTimeUser() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        return user["rewardTime"];
      }
    } on Exception catch (e) {
      print(e);
    }

    return -1;
  }
}
