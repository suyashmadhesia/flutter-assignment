part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TasksEvent {
  final Task task;

  const CreateTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}

class ShowLoadingScreenEvent extends TasksEvent {}

class UpdateTasksEvent extends TasksEvent {
  final String id;
  final String title;
  final String des;

  const UpdateTasksEvent(this.id, this.title, this.des);
  @override
  List<Object> get props => [id, title, des];
}

class GetTasksEvent extends TasksEvent {}
