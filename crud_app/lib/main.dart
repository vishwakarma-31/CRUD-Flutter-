import 'package:flutter/material.dart' show BuildContext, Builder, MaterialApp, MaterialPageRoute, Navigator, StatelessWidget, ThemeData, ThemeMode, Widget, WidgetsFlutterBinding, runApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/dependency_injection.dart';
import 'features/tasks/presentation/pages/task_list_page.dart';
import 'features/tasks/presentation/pages/task_form_page.dart';
import 'features/tasks/domain/bloc/task_bloc.dart';
import 'features/tasks/data/models/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (_) => di<TaskBloc>()..add(LoadTasksEvent()),
        child: Builder(
          builder:
              (context) => TaskListPage(
                onAddPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => BlocProvider.value(
                              value: context.read<TaskBloc>(),
                              child: const TaskFormPage(),
                            ),
                      ),
                    ),
              ),
        ),
      ),
    );
  }
}
