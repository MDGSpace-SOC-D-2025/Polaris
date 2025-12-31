import 'package:flutter/material.dart';
import 'package:polaris/pages/input_box.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login Page"),

          InputBox(inputText: "Email"),
          InputBox(inputText: "Password"),

          SizedBox(height: 25),

          Text("Not a member? SignUp"),
        ],
      ),
    );
  }
}
