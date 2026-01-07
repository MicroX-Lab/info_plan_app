# InfoPlan · 信息池

InfoPlan 是一个用于收集、整理与学习内容的移动应用。项目提供内容池导入、卡片式浏览、标签管理与学习计划追踪等能力，方便将碎片化信息沉淀为可执行的学习路线。

## 功能概览
- 内容导入：支持小红书/公众号入口及自定义来源，包含账户授权、收藏夹选择与批量添加提示。
- 卡片浏览：卡片可翻转查看摘要/详情，提供「阅读原文」「查看更多」操作与来源、时间、阅读时长信息。
- 标签管理：卡片上可展示多标签，入口跳转至标签管理页，帮助分类筛选。
- 学习计划：在「学习」页展示当前学习任务、进度与打卡按钮，任务状态持久化。
- 本地缓存：使用 `shared_preferences` 缓存内容、计划与标签数据，离线也能保留。
- 国际化与主题：内置中英文、亮暗主题，使用 `ScreenUtil` 适配常见机型。

## 技术栈
- Flutter 3 / Dart 3
- 状态管理：`provider`
- 路由：`go_router`
- 存储：`shared_preferences`（数据模型定义在 `lib/src/models`）
- 其他：`flutter_screenutil`、`flutter_tilt`、`dio` 等

## 目录速览
- `lib/main.dart`：入口，注入 `Provider` 并初始化尺寸适配。
- `lib/src/app.dart`：`MaterialApp.router`、主题与国际化配置。
- `lib/src/pages/`：核心页面（内容导入、浏览/学习、设置、标签管理等）。
- `lib/src/providers/`：内容、计划、标签、布局的状态管理。
- `lib/src/services/`：本地存储与示例数据。

## 开发与运行
前置：已安装 Flutter 3.6+ 与对应平台依赖（Xcode/Android SDK）。

```bash
flutter pub get
flutter run           # 运行到已连接的设备或模拟器
```

常用脚本：
- `flutter test` 运行测试
- `flutter pub run build_runner build --delete-conflicting-outputs` 生成模型/序列化代码（若后续引入）

## 配置
- 资源位于 `assets/images`、`assets/svgs`，字体使用 Manrope（`pubspec.yaml` 已声明）。
- 支持 `zh`/`en` 语言，默认标题为「信息池」。

## 贡献建议
- 保持 Dart/Flutter 格式与 `flutter_lints` 规则一致。
- 新增页面时复用 `AppSpacing`、`AppColors`、`AppTextStyle` 以保持一致的设计语言。
