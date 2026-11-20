import '../entities/task_entity.dart';

abstract interface class TaskRepository {
  Stream<List<TaskEntity>> watchTasks({
    String search = '',
    String? status,
    String? priority,
    int? assigneeId,
    bool trash = false,
    int limit = 50,
    String sortBy = 'created',
  });
}
