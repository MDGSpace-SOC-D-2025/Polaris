import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polaris/integration/rewardTime_integrate.dart';
import 'package:polaris/integration/todo_integrate.dart';
import 'package:polaris/pages/todo.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  // service
  final ToDoService todoService = ToDoService();
  final RewardTimeService rewardtimeService = RewardTimeService();

  //to do list LIST
  List<dynamic> todoList = [];

  //variable
  final todoTask = TextEditingController();

  var displayRewardtime = 0;

  var dateString = DateFormat('d/M/y').format(DateTime.now());

  Timer? refreshTimer;

  // function
  // to initialize this page
  @override
  void initState() {
    super.initState();
    getTask();
    loadDisplayRewardTime();

    refreshTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      loadDisplayRewardTime();
    });
  }

  // to get all the task of the specific user
  void getTask() async {
    print('getting tasks');
    var task = await todoService.getToDo();
    setState(() {
      print('Updated todoList length: ${todoList.length}');
      todoList = task;
      print('Updated todoList length: ${todoList.length}');
    });
  }

  // to get the reward time from backend and display in frontend
  void loadDisplayRewardTime() async {
    final val = await rewardtimeService.getRewardTimeUser();
    setState(() {
      displayRewardtime = val;
    });
  }

  // dialog box to add new task
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
                  decoration: InputDecoration(label: Text("Task")),
                  controller: todoTask,
                ),
              ],
            ),
          ),

          actions: [
            MaterialButton(
              onPressed: () async {
                await todoService.addToDo(taskName: todoTask.text);
                todoTask.clear();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                getTask();
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

      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait(
            [getTask(), loadDisplayRewardTime()]
                as Iterable<Future<dynamic>>, ////
          );
        },

        child: Column(
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
                        dateString,
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
                        "$displayRewardtime min left",
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
                  final currentTask = todoList[index];

                  return ToDoList(
                    taskName: currentTask['taskName'],
                    taskDone:
                        currentTask['taskDone'], // (currentTask['taskDone'] == true),
                    onDone: () async {
                      await rewardtimeService.completeToDo(
                        id: currentTask['_id'],
                      );
                      loadDisplayRewardTime();
                      getTask();
                    },
                    onDelete: () async {
                      await todoService.deleteToDo(id: currentTask['_id']);
                      print(todoList[index]);
                      getTask();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFFC3A372),
        onPressed: () {
          addNewTask(context);
        },
        child: Icon(Icons.add, color: Color(0xFF292B3A)),
      ),
    );
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }
}
