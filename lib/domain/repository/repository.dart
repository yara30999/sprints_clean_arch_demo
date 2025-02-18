import 'package:dartz/dartz.dart';
import '../entities/task_entity.dart';

abstract class Repository {
  Future<Either<String, List<TaskEntity>>> getTasks();
}
