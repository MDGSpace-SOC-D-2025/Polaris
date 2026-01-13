import 'package:flutter/material.dart';
import 'package:polaris/integration/user_integration.dart';
import 'package:polaris/pages/input_box.dart';
import 'package:polaris/pages/login.dart';
import 'package:polaris/pages/task_home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserService User_Service = UserService();

  final emailInput = TextEditingController();
  final userIdInput = TextEditingController();
  final passwordInput = TextEditingController();

  void registerUserOnClick() async {
    await User_Service.registerUserList(
      email: emailInput.text,
      userId: userIdInput.text,
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
          Text("SignUp Page"),

          InputBox(inputText: "Email", input: emailInput),
          InputBox(inputText: "User Id", input: userIdInput),
          InputBox(inputText: "Password", input: passwordInput),

          //InputBox(inputText: "Confirm Password"),
          SizedBox(height: 25),

          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            onPressed: registerUserOnClick,
            child: const Text('Submit'),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text("Already a member? Login"),
          ),
        ],
      ),
    );
  }
}
