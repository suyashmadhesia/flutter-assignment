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
      store?.getAll().then((tasks) {
        emit(ShowTasksState(tasks));
      });
    });
    on<CreateTaskEvent>((event, emit) {
      store?.set(event.task);
      add(GetTasksEvent());
    });
  }
}
