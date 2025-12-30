import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatefulWidget {
  final String taskName;
  bool taskDone;

  ToDoList({super.key, required this.taskName, this.taskDone = false});

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 60,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        //color: Colors.green,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF141C2F)),
      ),

      child: Row(
        children: [
          Checkbox(
            value: widget.taskDone,
            side: BorderSide(color: Color(0xFFF6F2E5)),
            activeColor: Colors.amber,
            onChanged: (bool? newValue) {
              setState(() {
                widget.taskDone = newValue!;
              });
            },
          ),

          Text(
            widget.taskName,
            style: TextStyle(
              fontFamily: "AverialLibre",
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xFFF6F2E5),
              decoration: widget.taskDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: Color(0xFFF6F2E5),
              decorationThickness: 2.0,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ],
      ),
    );
  }
}
