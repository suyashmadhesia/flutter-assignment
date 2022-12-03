import 'package:flutter/material.dart';
import 'package:trumsy/presentation/pages/home.dart';
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
          // return const Center(child: CircularProgressIndicator());
          return const HomePage();
        }
        return const Center(
          child: Text('Something went wrong'),
        );
      },
    );
  }
}
