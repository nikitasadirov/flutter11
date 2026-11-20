import '../../../data/database.dart';

abstract interface class TaskLocalDataSource {
  Stream<List<Task>> watchTasks({
    String search = '',
    String? status,
    String? priority,
    int? assigneeId,
    bool trash = false,
    int limit = 50,
    String sortBy = 'created',
  });
}

class DriftTaskLocalDataSource implements TaskLocalDataSource {
  const DriftTaskLocalDataSource(this._database);
  final AppDatabase _database;

  @override
  Stream<List<Task>> watchTasks({
    String search = '',
    String? status,
    String? priority,
    int? assigneeId,
    bool trash = false,
    int limit = 50,
    String sortBy = 'created',
  }) => _database.watchTasks(
    search: search,
    status: status,
    priority: priority,
    assigneeId: assigneeId,
    trash: trash,
    limit: limit,
    sortBy: sortBy,
  );
}
