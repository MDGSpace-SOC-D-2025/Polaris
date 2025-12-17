import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  bool taskDone;

  ToDoList({super.key, required this.taskName, this.taskDone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Text(
            "do homework",
            style: TextStyle(
              fontFamily: "AverialLibre",
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),

          Checkbox(
            value: taskDone,
            activeColor: Colors.amber,
            onChanged: (bool? newValue) {
              setState(() {
                taskDone = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

// class ToDo extends StatefulWidget {
//   final String taskName;
//   bool taskDone;

//   ToDo({
//   super.key, 
//   required this.taskName, 
//   this.taskDone = false
//   });

//   @override
//   State<ToDo> createState() => _ToDoState();
// }

// class _ToDoState extends State<ToDo> {
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder(
//       child: Container(
//         margin: EdgeInsets.all(20),
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: Row(
//           children: [
//             Text(
//               "do homework",
//               style: TextStyle(
//                 fontFamily: "AverialLibre",
//                 fontSize: 20,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//               ),
//             ),

//             Checkbox(
//               value: taskDone,
//               activeColor: Colors.amber,
//               onChanged: (bool? newValue) {
//                 setState(() {
//                   taskDone = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
