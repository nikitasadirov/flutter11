import '../../../data/database.dart';
import '../../domain/entities/task_entity.dart';

/// Database transfer model. It is kept inside the data layer and never exposed
/// to presentation widgets.
class TaskModel {
  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.projectId,
    required this.assigneeId,
    required this.priority,
    required this.status,
    required this.deadline,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final String title;
  final String description;
  final int projectId;
  final int? assigneeId;
  final String priority;
  final String status;
  final DateTime? deadline;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  factory TaskModel.fromDrift(Task row) => TaskModel(
    id: row.id,
    title: row.title,
    description: row.description,
    projectId: row.projectId,
    assigneeId: row.assigneeId,
    priority: row.priority,
    status: row.status,
    deadline: row.deadline,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
    deletedAt: row.deletedAt,
  );

  TaskEntity toEntity() => TaskEntity(
    id: id,
    title: title,
    description: description,
    projectId: projectId,
    assigneeId: assigneeId,
    priority: priority,
    status: status,
    deadline: deadline,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
