import '../../domain/entities/task_entity.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl(this._localDataSource);
  final TaskLocalDataSource _localDataSource;

  @override
  Stream<List<TaskEntity>> watchTasks({
    String search = '',
    String? status,
    String? priority,
    int? assigneeId,
    bool trash = false,
    int limit = 50,
    String sortBy = 'created',
  }) => _localDataSource
      .watchTasks(
        search: search,
        status: status,
        priority: priority,
        assigneeId: assigneeId,
        trash: trash,
        limit: limit,
        sortBy: sortBy,
      )
      .map(
        (rows) => rows
            .map(TaskModel.fromDrift)
            .map((model) => model.toEntity())
            .toList(growable: false),
      )
      .handleError((Object error, StackTrace _) {
        throw mapExceptionToFailure(error);
      });
}
