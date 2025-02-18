import 'package:dartz/dartz.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<TaskEntity>>> getTasks() async {
    try {
      final tasks = await remoteDataSource.getTasks();
      return Right(tasks);
    } catch (e) {
      return Left('Try again, Error While fetching tasks');
    }
  }
}
