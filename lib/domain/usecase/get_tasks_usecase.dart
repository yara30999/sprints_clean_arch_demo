import 'package:dartz/dartz.dart';

import '../entities/task_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetTasks implements BaseUseCase<void, List<TaskEntity>> {
  final Repository _repository;

  GetTasks(this._repository);

  @override
  Future<Either<String, List<TaskEntity>>> execute([void input]) async {
    return await _repository.getTasks();
  }
}
