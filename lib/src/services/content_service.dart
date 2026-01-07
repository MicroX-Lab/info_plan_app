import '../models/content.dart';

class ContentService {
  int _seed = 0;
  String _nextId() {
    _seed += 1;
    return 'mock-$_seed';
  }

  List<Content> get mockContents => [
        // 技术 / React / 学习
        Content(
          id: _nextId(),
          title: '如何在30天内学会React开发',
          content: '这是一篇系统化介绍React学习路径的文章……（完整内容）',
          summary: '本文介绍如何在30天内系统学习React，从基础概念到实战项目。',
          source: ContentSource.xiaohongshu,
          sourceName: '前端成长指南',
          publishDate: DateTime(2025, 1, 3),
          readTime: 8,
          tags: const ['技术', 'React', '学习'],
          url: 'https://example.com/react-30-days',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Content(
          id: _nextId(),
          title: 'React Hooks 深度解析：从基础到进阶',
          content: '详细讲解useState、useEffect等Hooks的用法和最佳实践……',
          summary: '从基础到进阶系统讲解React Hooks，帮助你写出更优雅的代码。',
          source: ContentSource.officialAccount,
          sourceName: '前端工坊',
          publishDate: DateTime(2025, 1, 2),
          readTime: 10,
          tags: const ['技术', 'React'],
          url: 'https://example.com/react-hooks',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        // 设计 / UI/UX
        Content(
          id: _nextId(),
          title: '设计系统的构建方法与实践',
          content: '如何从0到1搭建一套跨平台设计系统……',
          summary: '介绍构建设计系统的关键步骤和落地实践。',
          source: ContentSource.xiaohongshu,
          sourceName: '设计冷知识',
          publishDate: DateTime(2025, 1, 2),
          readTime: 7,
          tags: const ['设计', 'UI/UX'],
          url: 'https://example.com/design-system',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        // 效率 / 学习 / 方法论
        Content(
          id: _nextId(),
          title: '信息管理的艺术：如何应对信息过载',
          content: '讲解如何构建个人信息管理系统，避免被碎片信息淹没……',
          summary: '通过标签和信息池的方式管理信息，减少焦虑感。',
          source: ContentSource.officialAccount,
          sourceName: '效率研究所',
          publishDate: DateTime(2025, 1, 1),
          readTime: 6,
          tags: const ['效率', '学习', '方法论'],
          url: 'https://example.com/info-overload',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        // TypeScript / 工具
        Content(
          id: _nextId(),
          title: 'TypeScript 最佳实践：让你的代码更健壮',
          content: '涵盖类型系统、泛型、实用技巧以及团队落地规范……',
          summary: '用一组实战技巧帮助你在团队中推广 TypeScript。',
          source: ContentSource.xiaohongshu,
          sourceName: 'TS手册',
          publishDate: DateTime(2024, 12, 30),
          readTime: 9,
          tags: const ['技术', 'TypeScript', '工具'],
          url: 'https://example.com/ts-best-practices',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        // 前端工具链
        Content(
          id: _nextId(),
          title: '现代前端开发工具链：必备效率提升方案',
          content: '从包管理、构建、调试到监控的全链路工具实践……',
          summary: '精选前端工具链组合，帮助团队提效的指南。',
          source: ContentSource.officialAccount,
          sourceName: '前端工坊',
          publishDate: DateTime(2025, 1, 1),
          readTime: 7,
          tags: const ['工具', '效率'],
          url: 'https://example.com/frontend-tooling',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        // UI/UX / 系统
        Content(
          id: _nextId(),
          title: '系统化的UI/UX研究方法：从调研到落地',
          content: '覆盖用户调研、信息架构、交互细节与设计验证的系统流程……',
          summary: '一套可复制的 UI/UX 研究与落地方法论。',
          source: ContentSource.officialAccount,
          sourceName: '设计冷知识',
          publishDate: DateTime(2025, 1, 4),
          readTime: 11,
          tags: const ['设计', 'UI/UX', '系统'],
          url: 'https://example.com/uiux-systematic',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];
}

