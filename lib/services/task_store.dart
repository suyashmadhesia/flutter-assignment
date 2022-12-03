import 'package:shared_preferences/shared_preferences.dart';
import 'package:trumsy/models/task.dart';

class TaskStore {
  SharedPreferences? prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  TaskStore() {
    init();
  }

  Future<void> set(Task task) async {
    if (prefs == null) {
      await init();
    }
    prefs?.setString(task.id, task.toJSON());
  }

  Future<List<Task>> getAll() async {
    if (prefs == null) {
      await init();
    }
    List<Task> tasks = [];
    prefs?.getKeys().forEach((key) {
      tasks.add(Task.fromJSON(key));
    });
    return tasks;
  }

  Future<Task> get(String key) async {
    if (prefs == null) {
      await init();
    }
    return Task.fromJSON(prefs!.getString(key)!);
  }
}
