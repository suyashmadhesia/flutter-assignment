import "package:flutter/material.dart";
import 'package:trumsy/blocs/bloc.dart';
import 'package:trumsy/models/task.dart';
import 'package:trumsy/presentation/view/bloc_view.dart';
import 'package:trumsy/presentation/widgets/button.dart';
import 'package:trumsy/presentation/widgets/text_field.dart';
import 'package:trumsy/presentation/widgets/trumsy_tasks.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TasksBloc>(context).add(ShowLoadingScreenEvent());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Task'),
        centerTitle: true,
      ),
      body: RawScrollbar(
        thickness: 5,
        thumbColor: Colors.blue,
        radius: const Radius.circular(8.0),
        thumbVisibility: true,
        trackVisibility: true,
        trackColor: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.0625),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: height * 0.035,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(234, 245, 254, 255),
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 1.0,
                      offset: const Offset(0, 0.4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: height * 0.033),
                  tileColor: const Color.fromARGB(255, 203, 241, 255),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  onTap: () {
                    showAddTaskModal(context);
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03125,
                      ),
                      const Text(
                        'Custom (Create your own Task)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              const Text(
                "My Saved Custom Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              const TaskBlocBuilder(),
              SizedBox(
                height: height * 0.035,
              ),
              const Text(
                "Trumsy Recommended Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              TrumsyTasks(),
              SizedBox(
                height: height * 0.035,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showAddTaskModal(BuildContext parentContext,
    {bool edit = false, String id = "", String title = "", String des = ""}) {
  String taskName = "";
  String description = "";
  const Uuid uuid = Uuid();

  void onChangeTaskName(String value) {
    taskName = value;
  }

  void onChangeDescription(String value) {
    description = value;
  }

  return showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Create your own Task",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          const Text("Task Name"),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            onChanged: onChangeTaskName,
            textAlignment: TextAlign.start,
            hintText: title == "" ? "e.g. Eat Fresh Fruits" : title,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Description"),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            textAlignment: TextAlign.start,
            hintText: des == "" ? "e.g. Eat Fresh Fruits" : des,
            minLines: 4,
            maxLines: 5,
            keyboard: TextInputType.multiline,
            onChanged: onChangeDescription,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("You can find this task in\n\"My Saved Custom tasks\""),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                borderColor: Colors.blue,
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                buttonName: "Cancel",
              ),
              CustomButton(
                onPressed: () {
                  if (taskName.isNotEmpty && description.isNotEmpty && !edit) {
                    Task task = Task(
                        description: description,
                        title: taskName,
                        id: uuid.v4());
                    BlocProvider.of<TasksBloc>(parentContext)
                        .add(CreateTaskEvent(task));
                    Navigator.of(parentContext).pop();
                  } else {
                    if (edit && (taskName != "" || description != "")) {
                      BlocProvider.of<TasksBloc>(parentContext)
                          .add(UpdateTasksEvent(id, taskName, description));
                      Navigator.of(parentContext).pop();
                    }
                  }
                },
                fontColor: Colors.white,
                backgroundColor: Colors.blue,
                borderColor: Colors.blue,
                buttonName: "Save",
              ),
            ],
          ),
        ],
      );
    },
  );
}
