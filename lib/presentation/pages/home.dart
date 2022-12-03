import "package:flutter/material.dart";
import 'package:trumsy/blocs/bloc.dart';
import 'package:trumsy/presentation/widgets/button.dart';
import 'package:trumsy/presentation/widgets/text_field.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Scrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(234, 245, 254, 255),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
                  tileColor: const Color.fromARGB(255, 203, 241, 255),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  onTap: () {
                    showAddTaskModal(context);
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
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
              const SizedBox(height: 25.0),
              const Text(
                "My Saved Custom Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showAddTaskModal(BuildContext parentContext) {
  void save() {}

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
          const CustomTextField(
            textAlignment: TextAlign.start,
            hintText: "e.g. Eat Fresh Fruits",
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Description"),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            textAlignment: TextAlign.start,
            hintText: "e.g. Eat Fresh Fruits",
            minLines: 4,
            maxLines: 5,
            keyboard: TextInputType.multiline,
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
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                buttonName: "Cancel",
              ),
              CustomButton(
                onPressed: save,
                fontColor: Colors.white,
                backgroundColor: Colors.blue,
                buttonName: "Save",
              ),
            ],
          ),
        ],
      );
    },
  );
}
