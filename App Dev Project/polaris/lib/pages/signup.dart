import 'package:flutter/material.dart';
import 'package:polaris/pages/input_box.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SignUp Page"),

          InputBox(inputText: "Email"),
          InputBox(inputText: "User Id"),
          InputBox(inputText: "Password"),
          InputBox(inputText: "Confirm Password"),

          SizedBox(height: 25),

          Text("Already a member? Login"),
        ],
      ),
    );
  }
}
