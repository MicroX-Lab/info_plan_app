class Tag {
  Tag({
    required this.id,
    required this.name,
    this.parentId,
    this.color,
    this.icon,
    this.order = 0,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String? parentId;
  final String? color;
  final String? icon;
  final int order;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'color': color,
      'icon': icon,
      'order': order,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as String,
      name: map['name'] as String,
      parentId: map['parentId'] as String?,
      color: map['color'] as String?,
      icon: map['icon'] as String?,
      order: (map['order'] as int?) ?? 0,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}

