import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatefulWidget {
  final String taskName;
  bool taskDone;
  VoidCallback onDone;
  VoidCallback onDelete;

  ToDoList({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onDone,
    required this.onDelete,
  });

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 60,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0xFF000000)),
      ),

      child: Row(
        children: [
          Transform.scale(
            scale: 1.37,
            child: Checkbox(
              value: widget.taskDone,
              side: BorderSide(color: Color(0xFFCBCBCB)),
              shape: CircleBorder(),
              activeColor: Color(0xFFCBCBCB),
              checkColor: Color(0xFF000000),
              onChanged: (bool? value) {
                widget.onDone();
              },
            ),
          ),

          Text(
            widget.taskName,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.normal,
              color: Color(0xFF000000),
              decoration: widget.taskDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: Color(0xFF000000),
              decorationThickness: 2.0,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),

          Spacer(),

          IconButton(onPressed: (widget.onDelete), icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
