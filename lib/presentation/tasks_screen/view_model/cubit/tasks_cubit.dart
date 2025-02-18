import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/task_entity.dart';
import '../../../../domain/usecase/get_tasks_usecase.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final GetTasksUsecase _getTasksUsecase;

  TasksCubit(this._getTasksUsecase) : super(TasksInitial());

  Future<void> fetchTasks() async {
    emit(TasksLoading());
    final result = await _getTasksUsecase.execute();
    result.fold(
      (error) => emit(TasksError(error)),
      (tasks) => emit(TasksLoaded(tasks)),
    );
  }
}
