import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TaskApiService {
  final http.Client client;
  final String baseUrl = 'http://localhost:3000/tasks'; // change if needed

  TaskApiService(this.client);

  Future<List<TaskModel>> fetchTasks() async {
    final res = await client.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  Future<void> createTask(TaskModel task) async {
    await client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
  }

  Future<void> updateTask(String id, TaskModel task) async {
    await client.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
  }

  Future<void> deleteTask(String id) async {
    await client.delete(Uri.parse('$baseUrl/$id'));
  }
}
