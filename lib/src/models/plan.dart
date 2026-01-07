enum PlanStatus { inProgress, completed }

enum TaskStatus { todo, inProgress, completed }

class PlanTask {
  PlanTask({
    required this.id,
    required this.planId,
    required this.title,
    this.description,
    this.estimatedTime,
    this.status = TaskStatus.todo,
    this.tags = const [],
    this.contentId,
    this.order = 0,
    this.completedAt,
    required this.createdAt,
  });

  final String id;
  final String planId;
  final String title;
  final String? description;
  final int? estimatedTime;
  final TaskStatus status;
  final List<String> tags;
  final String? contentId;
  final int order;
  final DateTime? completedAt;
  final DateTime createdAt;

  PlanTask copyWith({
    TaskStatus? status,
    DateTime? completedAt,
  }) {
    return PlanTask(
      id: id,
      planId: planId,
      title: title,
      description: description,
      estimatedTime: estimatedTime,
      status: status ?? this.status,
      tags: tags,
      contentId: contentId,
      order: order,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'planId': planId,
      'title': title,
      'description': description,
      'estimatedTime': estimatedTime,
      'status': status.name,
      'tags': tags,
      'contentId': contentId,
      'order': order,
      'completedAt': completedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory PlanTask.fromMap(Map<String, dynamic> map) {
    return PlanTask(
      id: map['id'] as String,
      planId: map['planId'] as String,
      title: map['title'] as String,
      description: map['description'] as String?,
      estimatedTime: map['estimatedTime'] as int?,
      status: TaskStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => TaskStatus.todo,
      ),
      tags: (map['tags'] as List<dynamic>? ?? []).cast<String>(),
      contentId: map['contentId'] as String?,
      order: (map['order'] as int?) ?? 0,
      completedAt: map['completedAt'] != null ? DateTime.parse(map['completedAt'] as String) : null,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}

class Plan {
  Plan({
    required this.id,
    required this.goal,
    this.status = PlanStatus.inProgress,
    this.tasks = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String goal;
  final PlanStatus status;
  final List<PlanTask> tasks;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'goal': goal,
      'status': status.name,
      'tasks': tasks.map((t) => t.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['id'] as String,
      goal: map['goal'] as String,
      status: PlanStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => PlanStatus.inProgress,
      ),
      tasks: (map['tasks'] as List<dynamic>? ?? [])
          .map((e) => PlanTask.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }
}

