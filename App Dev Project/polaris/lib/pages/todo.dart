import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  bool taskDone;

  ToDoList({super.key, required this.taskName, this.taskDone = false});

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
            value: taskDone,
            side: BorderSide(color: Color(0xFFF6F2E5)),
            activeColor: Colors.amber,
            onChanged: (bool? newValue) {
              setState(() {
                taskDone = newValue!;
              });
            },
          ),

          Text(
            taskName,
            style: TextStyle(
              fontFamily: "AverialLibre",
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xFFF6F2E5),
            ),
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
