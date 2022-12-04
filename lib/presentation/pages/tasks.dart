import 'package:flutter/material.dart';
import 'package:trumsy/models/task.dart';
import 'package:trumsy/presentation/pages/home.dart';

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

  List<Widget> tasksListWidget(double width, double height) {
    List<Widget> tasksWidgets = [];
    for (Task task in widget.tasks) {
      double widthPer = 0.0;
      int len = task.title.length;
      if (len <= 15) {
        widthPer = 0.25;
      } else if (len > 15 && len <= 30) {
        widthPer = 2 * 0.25 + 0.0625;
      } else {
        widthPer = 0.75 + 0.125;
      }
      final Column taskWidget = Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            width: width * widthPer,
            height: height * 0.137,
            decoration: BoxDecoration(
              color: const Color.fromARGB(234, 216, 236, 255),
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1.0,
                  offset: const Offset(0, 0.4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                task.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            child: const Text(
              "Edit",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              showAddTaskModal(
                context,
                edit: true,
                id: task.id,
                title: task.title,
                des: task.description,
              );
            },
          )
        ],
      );
      tasksWidgets.add(taskWidget);
    }
    return tasksWidgets;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Wrap(
      spacing: width * 0.0625, // gap between adjacent chips
      runSpacing: height * 0.03,
      children: tasksListWidget(width, height),
    );
  }
}
