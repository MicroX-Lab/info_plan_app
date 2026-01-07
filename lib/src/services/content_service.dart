import '../models/content.dart';

class ContentService {
  int _seed = 0;
  String _nextId() {
    _seed += 1;
    return 'mock-$_seed';
  }

  String get _react30Days =>
      '这是一篇系统化介绍 React 学习路径的文章，覆盖基础概念、'
      'Hooks、路由、状态管理、工程化与最佳实践。'
      '\n\n第1周：掌握 JSX、组件化思维、状态与属性，理解函数组件与类组件的差异；'
      '第2周：深入 Hooks（useState、useEffect、useMemo、useCallback、'
      '自定义 Hook），完成一个 Todo/笔记类小项目；'
      '第3周：路由（React Router）、全局状态（Context/Redux/Zustand）、'
      '表单与异步数据请求；'
      '第4周：工程化（Vite/CRA 打包优化）、性能调优、单元测试、'
      '上线与监控。'
      '\n\n文章还提供了一套每日练习清单与参考资料链接，帮助读者按照 30 天节奏完成学习计划。';

  String get _reactHooksDeep =>
      '全文分为基础篇、进阶篇与实战篇。基础篇梳理 useState 与 useEffect 的执行时机、'
      '依赖数组陷阱、清理函数规范；进阶篇讲解 useMemo/useCallback 的性能边界、'
      'Ref 与 ImperativeHandle 的用法、以及自定义 Hook 的抽象模式；'
      '实战篇通过「请求缓存 + 重试」与「表单自动保存」两个例子，展示如何组合多个 Hook。'
      '\n\n文末给出了代码风格建议：避免在渲染期间创建新函数、'
      '对外暴露稳定的 Hook API、在复杂副作用中分拆逻辑并添加注释。';

  String get _designSystem =>
      '文章介绍如何从 0 到 1 搭建设计系统：'
      '1）原则与基线：色板、字号、间距、栅格；'
      '2）组件库：按钮、输入框、导航、卡片的交互与状态；'
      '3）文档与资产：Figma/Storybook 双轨，提供设计令牌同步方案；'
      '4）落地：与前端协同的版本管理、变更日志、可访问性测试。'
      '\n\n附录包含一份组件 Checklist，帮助团队在发布前完成校验。';

  String get _infoOverload =>
      '文章讲述如何构建个人信息管理系统来应对信息过载：'
      '收集—分类—加工—输出 的闭环，利用标签与优先级做「稍后读」与「深度读」分层；'
      '使用固定的每周回顾时间整理 inbox，输出摘要或卡片。'
      '\n\n作者提供了实践模板（每日 10 分钟收敛 + 每周 1 次回顾），'
      '并给出常见失败模式：标签过多、未设定清理节奏、只收藏不复盘。';

  String get _tsBestPractices =>
      '内容涵盖类型系统要点：字面量类型、联合/交叉、条件类型、'
      '泛型工具、Mapped Types，以及在团队中的落地规范。'
      '\n\n示例展示了如何为 API 响应、表单、事件总线设计类型，'
      '以及在 React 项目里分层定义 Props/State/Domain Model。'
      '文末给出了 ESLint + TSConfig 推荐配置和常见踩坑案例。';

  String get _frontendTooling =>
      '这是一份现代前端工具链指南：包管理（pnpm）、构建（Vite/Rspack）、'
      '调试（Source Map/Profiler）、质量（ESLint/Prettier/TypeCheck）、'
      '监控与性能（Web Vitals、错误上报）。'
      '\n\n作者提供了一个最小可用的模板仓库结构，并解释每个工具的接入顺序与收益。';

  String get _uiuxSystematic =>
      '文章覆盖用户调研、信息架构、交互细节与设计验证：'
      '从访谈脚本、卡片分类、线框到高保真落地，并给出可复制的验收标准。'
      '\n\n还包含一套可视化的研究模板，帮助团队复用方法并确保一致性。';

  List<Content> get mockContents => [
        // 技术 / React / 学习
        Content(
          id: _nextId(),
          title: '如何在30天内学会React开发',
          content: _react30Days,
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
          content: _reactHooksDeep,
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
          content: _designSystem,
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
          content: _infoOverload,
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
          content: _tsBestPractices,
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
          content: _frontendTooling,
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
          content: _uiuxSystematic,
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

