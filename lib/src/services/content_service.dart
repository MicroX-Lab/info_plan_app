import '../models/content.dart';

class ContentService {
  List<Content> get mockContents => [
        Content(
          id: '1',
          title: '如何在30天内学会React开发',
          content:
              '学习 React 开发需要循序渐进的方法。第一周专注于理解 React 的核心概念，包括组件化思维、JSX 语法和虚拟 DOM。第二周深入学习 Hooks，掌握 useState、useEffect 等常用钩子。第三周学习状态管理，如 Context、Redux 或 Zustand……',
          summary: '介绍了系统化的 React 学习路径，包含每日计划与练习。',
          source: ContentSource.xiaohongshu,
          sourceName: '小红书',
          publishDate: DateTime(2025, 1, 3),
          readTime: 8,
          tags: const ['技术', 'React', '学习'],
          url: 'https://example.com/react-30-days',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Content(
          id: '2',
          title: '掌握 Props 和 State 的使用',
          content: '理解组件如何通过 Props 传递数据，以及如何使用 State 管理组件内部状态。',
          summary: '状态管理入门，介绍 Props 与 State。',
          source: ContentSource.officialAccount,
          sourceName: '公众号',
          publishDate: DateTime(2025, 1, 2),
          readTime: 5,
          tags: const ['技术', 'React', '状态'],
          url: 'https://example.com/props-state',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];
}

