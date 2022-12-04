import 'package:flutter/material.dart';

import '../../services/task_store.dart';
import '../bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TaskStore? store;
  TasksBloc() : super(TasksState()) {
    on<ShowLoadingScreenEvent>((event, emit) async {
      emit(LoadingTasksState());
      store = TaskStore();
      if (store?.prefs == null) {
        await store?.init();
      }
      add(GetTasksEvent());
    });
    on<GetTasksEvent>((event, emit) {
      emit(LoadingTasksState());
      store?.getAll().then((tasks) {
        emit(ShowTasksState(tasks));
      });
    });
    on<CreateTaskEvent>((event, emit) {
      store?.set(event.task);
      add(GetTasksEvent());
    });
    on<UpdateTasksEvent>(((event, emit) async {
      Task? task = await store?.get(event.id);
      store?.deleteTask(event.id);
      String title = event.title == "" ? task!.title : event.title;
      String des = event.des == "" ? task!.description : event.des;
      store?.set(Task(description: des, title: title, id: event.id));
      add(GetTasksEvent());
    }));
  }
}
