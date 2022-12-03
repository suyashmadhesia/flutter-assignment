part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class CreateTasksEvent extends TasksEvent {
  final Task task;

  const CreateTasksEvent(this.task);
  @override
  List<Object> get props => [task];
}

class ShowLoadingScreenEvent extends TasksEvent {}

class UpdateTasksEvent extends TasksEvent {
  final Task task;

  const UpdateTasksEvent(this.task);
  @override
  List<Object> get props => [task];
}
