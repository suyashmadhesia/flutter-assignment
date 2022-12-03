import 'package:flutter/material.dart';
import 'package:trumsy/models/task.dart';

class TasksWidget extends StatefulWidget {
  final List<Task> tasks;
  const TasksWidget({super.key, required this.tasks});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
