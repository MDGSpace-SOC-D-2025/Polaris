import 'package:flutter/material.dart';
import 'package:polaris/integration/login_integrate.dart';
import 'package:polaris/pages/input_box.dart';
import 'package:polaris/pages/task_home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginService Login_Service = LoginService();

  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  void loginUserOnClick() async {
    await Login_Service.loginUserList(
      email: emailInput.text,
      password: passwordInput.text,
    );
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Task()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login Page"),

          InputBox(inputText: "Email", input: emailInput),
          InputBox(inputText: "Password", input: passwordInput),
          SizedBox(height: 25),

          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            onPressed: loginUserOnClick,
            child: const Text('Submit'),
          ),

          Text("Not a member? SignUp"),
        ],
      ),
    );
  }
}
