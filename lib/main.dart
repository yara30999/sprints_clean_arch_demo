import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di.dart';
import 'presentation/tasks_screen/view/tasks_view.dart';
import 'presentation/tasks_screen/view_model/cubit/tasks_cubit.dart';

void main() {
  initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Arch Demo',
      home: BlocProvider(
        create: (context) => TasksCubit(instance()),
        child: TasksView(),
      ),
    );
  }
}
