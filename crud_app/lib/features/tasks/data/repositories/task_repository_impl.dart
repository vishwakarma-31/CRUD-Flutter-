import 'package:crud_app/features/tasks/data/repositories/task_repository.dart';
import 'package:hive/hive.dart';
import '../../data/models/task_model.dart';
import '../services/task_api_service.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskApiService api;
  final Box<TaskModel> taskBox;

  TaskRepositoryImpl(this.api, this.taskBox);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final tasks = await api.fetchTasks();
      await taskBox.clear();
      for (var task in tasks) {
        await taskBox.put(task.id, task);
      }
      return tasks;
    } catch (_) {
      return taskBox.values.toList(); // fallback to local
    }
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
    try {
      await api.createTask(task);
    } catch (_) {}
  }

  @override
  Future<void> updateTask(String id, TaskModel task) async {
    await taskBox.put(id, task);
    try {
      await api.updateTask(id, task);
    } catch (_) {}
  }

  @override
  Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
    try {
      await api.deleteTask(id);
    } catch (_) {}
  }
}
