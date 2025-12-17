import 'package:flutter/material.dart';
import 'package:polaris/pages/todo.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  //addNewTask method
  void addNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("New Task"),

          content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(decoration: InputDecoration(label: Text("Task"))),
                TextField(
                  decoration: InputDecoration(label: Text("Task Details")),
                ),
              ],
            ),
          ),

          actions: [
            MaterialButton(onPressed: () {}, child: Text("Ok")),

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "My To Do List",
          style: TextStyle(
            fontFamily: "Miniver",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              height: 50,
              color: Colors.blue,
              margin: const EdgeInsets.all(20.0),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(24),
              // ),
              child: Center(
                child: Text(
                  "Date",
                  style: TextStyle(
                    fontFamily: "AverialLibre",
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              height: 50,
              color: Colors.blue,
              margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
              child: Center(
                child: Text(
                  "hello",
                  style: TextStyle(
                    fontFamily: "AverialLibre",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //body: ListView(children: [ToDoList(taskName: "task1")]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
