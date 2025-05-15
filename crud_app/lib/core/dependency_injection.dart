import 'package:crud_app/features/tasks/data/repositories/task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../../features/tasks/data/models/task_model.dart';
import '../../features/tasks/data/services/task_api_service.dart';
import '../../features/tasks/domain/bloc/task_bloc.dart';
import '../../features/tasks/data/repositories/task_repository_impl.dart';

final GetIt di = GetIt.instance;

void setupDependencies() {
  final taskBox = Hive.box<TaskModel>('tasks');
  di.registerLazySingleton(() => http.Client());
  di.registerLazySingleton(() => TaskApiService(di()));
  di.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(di(), taskBox),
  );
  di.registerFactory(() => TaskBloc(repository: di()));
}
