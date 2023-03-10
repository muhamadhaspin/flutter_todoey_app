// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todoey_app/components/tasks_list.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        //
        backgroundColor: Colors.red,
        //
        child: const Icon(Icons.add),
      ),
      //
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
              //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      //
                      color: Colors.red,
                      //
                      size: 30,
                    ),
                  ),
                  //
                  const SizedBox(height: 10),
                  //
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                //
                child: const TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
