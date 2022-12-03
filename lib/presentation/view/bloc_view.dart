import 'package:flutter/material.dart';
import 'package:trumsy/presentation/pages/tasks.dart';
import '../../blocs/bloc.dart';

class TaskBlocBuilder extends StatefulWidget {
  const TaskBlocBuilder({super.key});

  @override
  State<TaskBlocBuilder> createState() => _TaskBlocBuilderState();
}

class _TaskBlocBuilderState extends State<TaskBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is LoadingTasksState) {
          return const CircularProgressIndicator();
        } else if (state is ShowTasksState) {
          if (state.tasks.isEmpty) {
            return const Text('No Tasks');
          } else {
            return TasksWidget(tasks: state.tasks);
          }
        }
        return const Text('Something went wrong');
      },
    );
  }
}
