import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({required super.id, required super.title});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(id: json['id'], title: json['title']);
  }
}
