class TaskEntity {
  const TaskEntity({
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
}
