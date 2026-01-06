import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String inputText;
  final TextEditingController input;

  const InputBox({super.key, required this.inputText, required this.input});

  @override
  State<InputBox> createState() => InputBoxState();
}

class InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextField(
        controller: widget.input,
        decoration: InputDecoration(label: Text(widget.inputText)),
      ),
    );
  }
}
