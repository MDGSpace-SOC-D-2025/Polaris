import 'package:flutter/material.dart';
import 'package:polaris/instagram/blocking.dart';
import 'package:polaris/integration/login_integrate.dart';
import 'package:polaris/pages/input_box.dart';
import 'package:polaris/pages/signup.dart';
import 'package:polaris/pages/task_home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // service
  LoginService loginService = LoginService();

  // variable
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  bool openFirst = true; // variable to give permission to app

  // functions - for logging in the user on clicking submit button
  void loginUserOnClick() async {
    bool loginSuccessful = await loginService.loginUserList(
      email: emailInput.text,
      password: passwordInput.text,
    );

    if (loginSuccessful == true) {
      if (openFirst == true) {
        await takingPermission();
        openFirst = false;
      }

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Task()),
      );
    } else {
      print('login unsuccessful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Page', style: TextStyle(fontSize: 24)),

          InputBox(inputText: 'Email', input: emailInput),
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
            onPressed: loginUserOnClick,
            child: const Text('Submit'),
          ),

          SizedBox(height: 25),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text('Not a member? SignUp'),
          ),
        ],
      ),
    );
  }
}
