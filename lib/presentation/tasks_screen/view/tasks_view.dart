import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/tasks_cubit.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state is TasksLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TasksLoaded) {
            return ListView.separated(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 87, 120, 93),
                  child: ListTile(
                    leading: Text(
                      state.tasks[index].id.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    title: Text(
                      state.tasks[index].title,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else if (state is TasksError) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<TasksCubit>().fetchTasks(),
              child: Text('Fetch Tasks'),
            ),
          );
        },
      ),
    );
  }
}
