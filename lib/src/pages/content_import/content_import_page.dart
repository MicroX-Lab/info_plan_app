import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';
import '../../widgets/pill_tag.dart';

void _showComingSoon(BuildContext context, String feature) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('$feature 功能即将开放')),
  );
}

class ContentImportPage extends StatefulWidget {
  const ContentImportPage({super.key});

  @override
  State<ContentImportPage> createState() => _ContentImportPageState();
}

class _ContentImportPageState extends State<ContentImportPage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
        title: const Text('内容池', style: TextStyle(fontWeight: FontWeight.w700)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                border: Border.all(color: AppColors.border),
              ),
              child: TabBar(
                controller: _controller,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.textPrimary,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                ),
                tabs: const [
                  Tab(text: '小红书'),
                  Tab(text: '公众号'),
                  Tab(text: '自定义'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          _XhsImport(),
          _OfficialImport(),
          _CustomImport(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({required this.hint, this.suffixIcon, this.maxLines = 1});
  final String hint;
  final IconData? suffixIcon;
  final int maxLines;
  void _showAction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('功能即将支持：$hint')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
              maxLines: maxLines,
            ),
          ),
          if (suffixIcon != null)
            IconButton(
              onPressed: () => _showAction(context),
              icon: Icon(suffixIcon, color: AppColors.textSecondary),
            ),
        ],
      ),
    );
  }
}

class _XhsImport extends StatelessWidget {
  const _XhsImport();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _SectionTitle('添加设置'),
        _ListItem(
          title: '账户授权',
          trailing: '选择账号',
          onTap: () => _showComingSoon(context, '账户授权'),
        ),
        _ListItem(
          title: '导入收藏夹',
          trailing: '选择收藏夹',
          onTap: () => _showComingSoon(context, '导入收藏夹'),
        ),
        _ListItem(
          title: '内容发布时间',
          trailing: '选择时间范围',
          onTap: () => _showComingSoon(context, '内容发布时间'),
        ),
        const _SectionTitle('添加内容'),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: const [
              _InputField(hint: '输入博主名称, 回车添加', suffixIcon: Icons.cloud_upload_outlined),
              SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '可上传关注列表截图, 我们自动识别名称并批量添加',
                  style: AppTextStyle.caption,
                ),
              ),
            ],
          ),
        ),
        const _SectionTitle('已添加内容'),
        const _AddedList(),
      ],
    );
  }
}

class _OfficialImport extends StatelessWidget {
  const _OfficialImport();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _SectionTitle('添加设置'),
        _ListItem(
          title: '内容发布时间',
          trailing: '选择时间范围',
          onTap: () => _showComingSoon(context, '内容发布时间'),
        ),
        const _SectionTitle('添加内容'),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: const [
              _InputField(hint: '输入公众号名称, 回车添加', suffixIcon: Icons.cloud_upload_outlined),
              SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '可上传关注列表截图, 我们自动识别名称并批量添加',
                  style: AppTextStyle.caption,
                ),
              ),
            ],
          ),
        ),
        const _SectionTitle('已添加内容'),
        const _AddedList(),
      ],
    );
  }
}

class _CustomImport extends StatelessWidget {
  const _CustomImport();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _SectionTitle('添加内容'),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: const [
              _InputField(hint: '输入 url', suffixIcon: Icons.cloud_upload_outlined),
              SizedBox(height: AppSpacing.md),
              _InputField(hint: '标题'),
              SizedBox(height: AppSpacing.md),
              _InputField(hint: '内容', maxLines: 4),
            ],
          ),
        ),
        const _SectionTitle('已添加内容'),
        const _AddedList(),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({required this.title, required this.trailing, this.onTap});
  final String title;
  final String trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 16, color: AppColors.textPrimary)),
            const Spacer(),
            Text(trailing, style: const TextStyle(color: AppColors.textSecondary)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _AddedList extends StatelessWidget {
  const _AddedList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AddedItem(
          title: '如何在30天内学会React开发',
          date: '2025-01-03',
          tags: const ['技术', 'React'],
        ),
        _AddedItem(
          title: '设计系统的构建方法与实践',
          date: '2025-01-02',
          tags: const ['设计', 'UI/UX'],
        ),
        _AddedItem(
          title: '信息管理的艺术：如何应对信息过载',
          date: '2025-01-01',
          tags: const ['效率', '学习'],
        ),
      ],
    );
  }
}

class _AddedItem extends StatelessWidget {
  const _AddedItem({required this.title, required this.date, required this.tags});
  final String title;
  final String date;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.titleMedium),
          const SizedBox(height: 4),
          Text(date, style: AppTextStyle.caption),
          const SizedBox(height: 8),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: tags.map((t) => PillTag(text: t)).toList(),
          ),
        ],
      ),
    );
  }
}

