import '../../data/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(String id, TaskModel task);
  Future<void> deleteTask(String id);
}
