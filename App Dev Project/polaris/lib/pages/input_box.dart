import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String inputText;

  const InputBox({super.key, required this.inputText});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextField(
        decoration: InputDecoration(label: Text(widget.inputText)),
        controller: input,
      ),
    );
  }
}
