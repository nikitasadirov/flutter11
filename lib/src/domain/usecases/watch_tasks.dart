import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// Loads the current task list using the requested search and filter criteria.
class WatchTasksUseCase {
  const WatchTasksUseCase(this._repository);
  final TaskRepository _repository;

  Stream<List<TaskEntity>> call({
    String search = '',
    String? status,
    String? priority,
    int? assigneeId,
    bool trash = false,
    int limit = 50,
    String sortBy = 'created',
  }) => _repository.watchTasks(
    search: search,
    status: status,
    priority: priority,
    assigneeId: assigneeId,
    trash: trash,
    limit: limit,
    sortBy: sortBy,
  );
}
