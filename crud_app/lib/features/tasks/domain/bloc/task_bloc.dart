import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc({required this.repository}) : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await repository.getTasks();
        emit(TaskLoaded(tasks));
      } catch (_) {
        emit(TaskError('Failed to load tasks'));
      }
    });

    on<AddTaskEvent>((event, emit) async {
      await repository.addTask(event.task);
      add(LoadTasksEvent());
    });

    on<UpdateTaskEvent>((event, emit) async {
      await repository.updateTask(event.task.id, event.task);
      add(LoadTasksEvent());
    });

    on<DeleteTaskEvent>((event, emit) async {
      await repository.deleteTask(event.taskId);
      add(LoadTasksEvent());
    });
  }
}
