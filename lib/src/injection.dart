import '../data/database.dart';
import 'data/datasources/task_local_data_source.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/usecases/watch_tasks.dart';
import 'presentation/controllers/task_list_controller.dart';

/// Central composition root. Construct dependencies here, never in a widget.
class Dependencies {
  Dependencies._(this.database, this.taskRepository, this.watchTasks);

  final AppDatabase database;
  final TaskRepository taskRepository;
  final WatchTasksUseCase watchTasks;

  factory Dependencies.configure({AppDatabase? database}) {
    final db = database ?? AppDatabase();
    final source = DriftTaskLocalDataSource(db);
    final repository = TaskRepositoryImpl(source);
    return Dependencies._(db, repository, WatchTasksUseCase(repository));
  }

  TaskListController createTaskListController() =>
      TaskListController(watchTasks);
}
