part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingTasksState extends TasksState {}

class ShowTasksState extends TasksState {
  final List<Task> tasks;

  ShowTasksState(this.tasks);

  @override
  List<Object> get props => [tasks];
}
