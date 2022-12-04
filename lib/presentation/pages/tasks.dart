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
  void initState() {
    for (Task task in widget.tasks) {
      debugPrint(task.title);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Something here"),
    );
  }
}
