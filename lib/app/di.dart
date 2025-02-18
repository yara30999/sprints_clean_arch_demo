import 'package:get_it/get_it.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/get_tasks_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

  // get tasks usecase
  if (!GetIt.I.isRegistered<GetTasksUsecase>()) {
    instance.registerFactory<GetTasksUsecase>(
      () => GetTasksUsecase(instance()),
    );
  }
}
