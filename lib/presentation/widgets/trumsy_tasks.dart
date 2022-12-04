import 'package:flutter/material.dart';

class TrumsyTasks extends StatelessWidget {
  TrumsyTasks({super.key});
  final List<String> trumsyRecommendedTasks = [
    "Make your bed",
    "Cleaning",
    "Sports",
    "Bringing in the garbage cans",
    "Watering Plants",
    "Helping with meal planning and making grocery lists"
  ];

  List<Widget> tasksListWidget(
      double width, List<String> tasks, double height) {
    List<Widget> tasksWidgets = [];
    for (String task in tasks) {
      double widthPer = 0.0;
      int len = task.length;
      if (len <= 15) {
        widthPer = 0.25;
      } else if (len > 15 && len <= 30) {
        widthPer = 2 * 0.25 + 0.0625;
      } else {
        widthPer = 0.75 + 0.125;
      }
      final Container taskWidget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        width: width * widthPer,
        height: height * 0.137,
        decoration: BoxDecoration(
          color: const Color.fromARGB(234, 255, 222, 216),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1.0,
              offset: const Offset(0, 0.4),
            ),
          ],
        ),
        child: Center(
          child: Text(task, textAlign: TextAlign.center),
        ),
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
      children: tasksListWidget(width, trumsyRecommendedTasks, height),
    );
  }
}
