import 'package:flutter/material.dart';
import 'package:polaris/pages/todo.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //to do list LIST
  List todoList = ["task1", "task2"];

  final todoTask = TextEditingController();

  //addNewTask dialog box
  void addNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFC2A273),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Text(
            "New Task",
            style: TextStyle(
              fontFamily: "Miniver",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF141C2F),
            ),
          ),

          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    label: Text(
                      "Task",
                      // style: TextStyle(
                      //   fontFamily: "AverialLibre",
                      //   fontSize: 17,
                      //   decorationColor: Color(0xFF141C2F),
                      // ),
                    ),
                  ),
                  controller: todoTask,
                ),
                // TextField(
                //   decoration: InputDecoration(label: Text("Task Details")),
                // ),
              ],
            ),
          ),

          actions: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  todoList.add(todoTask.text);
                });
                Navigator.pop(context);
                todoTask.clear();
              },
              child: Text("Ok"),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  //home page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF38404F),
      appBar: AppBar(
        backgroundColor: Color(0xFF141C2F),
        title: Text(
          "To Do List",
          style: TextStyle(
            fontFamily: "Miniver",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFA1772D),
          ),
        ),
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(right: 15, top: 15, left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFC2A273),
                  ),
                  child: Center(
                    child: Text(
                      "Date",
                      style: TextStyle(
                        fontFamily: "AverialLibre",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF292B3A),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(right: 15, top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFC2A273),
                  ),
                  child: Center(
                    child: Text(
                      "RewardTime",
                      style: TextStyle(
                        fontFamily: "AverialLibre",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF292B3A),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ToDoList(taskName: todoList[index]);
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFFC3A372),
        onPressed: () => addNewTask(context),
        child: Icon(Icons.add, color: Color(0xFF292B3A)),
      ),
    );
  }
}
