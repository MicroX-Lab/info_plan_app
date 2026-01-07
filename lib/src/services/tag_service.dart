import '../models/tag.dart';

class TagService {
  List<Tag> get mockTags {
    final now = DateTime.now();
    final tech = Tag(id: 'tag-tech', name: '技术', createdAt: now);
    final design = Tag(id: 'tag-design', name: '设计', createdAt: now);
    final efficiency = Tag(id: 'tag-eff', name: '效率', createdAt: now);

    return [
      tech,
      design,
      efficiency,
      Tag(id: 'tag-react', name: 'React', parentId: tech.id, createdAt: now),
      Tag(id: 'tag-ts', name: 'TypeScript', parentId: tech.id, createdAt: now),
      Tag(id: 'tag-tools', name: '工具', parentId: tech.id, createdAt: now),
      Tag(id: 'tag-uiux', name: 'UI/UX', parentId: design.id, createdAt: now),
      Tag(id: 'tag-system', name: '系统', parentId: design.id, createdAt: now),
      Tag(id: 'tag-study', name: '学习', parentId: efficiency.id, createdAt: now),
      Tag(id: 'tag-method', name: '方法论', parentId: efficiency.id, createdAt: now),
    ];
  }
}

