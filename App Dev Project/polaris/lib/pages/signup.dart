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
  // services
  UserService userService = UserService();

  // variables
  final emailInput = TextEditingController();
  final userIdInput = TextEditingController();
  final passwordInput = TextEditingController();

  // functions - for registering the user on clicking submit button
  void registerUserOnClick() async {
    await userService.registerUserList(
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
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SignUp Page', style: TextStyle(fontSize: 24)),

          InputBox(inputText: 'Email', input: emailInput),
          InputBox(inputText: 'User Id', input: userIdInput),
          InputBox(inputText: 'Password', input: passwordInput),

          SizedBox(height: 25),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF89DC8C),
              foregroundColor: Color(0xFF000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: registerUserOnClick,
            child: const Text('Submit'),
          ),

          SizedBox(height: 25),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text('Already a member? Login'),
          ),
        ],
      ),
    );
  }
}
