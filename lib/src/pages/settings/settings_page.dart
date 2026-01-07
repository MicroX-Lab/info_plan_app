import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int defaultHome = 0; // 0 browse, 1 learn
  int frequency = 0; // 0 daily, 1 3days, 2 manual
  bool cacheReuse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
        title: const Text('设置', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        children: [
          _SectionTitle('默认首页'),
          _SegmentedControl(
            options: const ['浏览模式', '学习模式'],
            value: defaultHome,
            onChanged: (v) => setState(() => defaultHome = v),
          ),
          _SectionTitle('内容处理'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('处理触发频率', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.sm),
                _SegmentedControl(
                  options: const ['1天1次', '3天1次', '手动'],
                  value: frequency,
                  onChanged: (v) => setState(() => frequency = v),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text('自动处理新内容的频率设置', style: AppTextStyle.caption),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    const Text('缓存复用', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    Switch(
                      value: cacheReuse,
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => cacheReuse = v),
                    ),
                  ],
                ),
                const Text('重复内容将从缓存中获取, 节省处理时间', style: AppTextStyle.caption),
              ],
            ),
          ),
          _SectionTitle('关于'),
          _InfoRow(title: '版本', trailing: '1.0.0'),
          _InfoRow(title: '隐私政策'),
          _InfoRow(title: '使用条款'),
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

class _SegmentedControl extends StatelessWidget {
  const _SegmentedControl({required this.options, required this.value, required this.onChanged});
  final List<String> options;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: List.generate(options.length, (index) {
          final active = value == index;
          return Expanded(
            child: InkWell(
              onTap: () => onChanged(index),
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: active ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.title, this.trailing});
  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          if (trailing != null) Text(trailing!, style: const TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

