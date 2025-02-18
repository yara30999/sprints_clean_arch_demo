import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => TaskModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
