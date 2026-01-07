import 'package:intl/intl.dart';

enum ContentSource { xiaohongshu, officialAccount, custom }

class Content {
  Content({
    required this.id,
    required this.title,
    required this.content,
    this.summary,
    required this.source,
    this.sourceName,
    this.url,
    this.publishDate,
    this.readTime,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
  });

  final String id;
  final String title;
  final String content;
  final String? summary;
  final ContentSource source;
  final String? sourceName;
  final String? url;
  final DateTime? publishDate;
  final int? readTime;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;

  String get displayDate =>
      publishDate != null ? DateFormat('yyyy-MM-dd').format(publishDate!) : '';
  String get displayReadTime => readTime != null ? '约 $readTime 分钟' : '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'summary': summary,
      'source': source.name,
      'sourceName': sourceName,
      'url': url,
      'publishDate': publishDate?.toIso8601String(),
      'readTime': readTime,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'syncedAt': syncedAt?.toIso8601String(),
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      summary: map['summary'] as String?,
      source: ContentSource.values.firstWhere(
        (e) => e.name == map['source'],
        orElse: () => ContentSource.custom,
      ),
      sourceName: map['sourceName'] as String?,
      url: map['url'] as String?,
      publishDate: map['publishDate'] != null ? DateTime.parse(map['publishDate'] as String) : null,
      readTime: map['readTime'] as int?,
      tags: (map['tags'] as List<dynamic>? ?? []).cast<String>(),
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      syncedAt: map['syncedAt'] != null ? DateTime.parse(map['syncedAt'] as String) : null,
    );
  }
}

