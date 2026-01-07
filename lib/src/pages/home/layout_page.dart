import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/content_provider.dart';
import '../../providers/layout_provider.dart';
import '../../routes.dart';
import '../../widgets/primary_button.dart';
import '../learn/learn_page.dart';
import 'browse_page.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<LayoutProvider>();
    final hasContent = context.watch<ContentProvider>().hasContent;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('信息池', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
        actions: [
          IconButton(
            icon: const Icon(Icons.label_outline),
            onPressed: () => context.pushNamed(AppRoute.tags.name),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(AppRoute.settings.name),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.sm),
          _TabSwitcher(
            current: layout.currentTab,
            onChanged: layout.switchTab,
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: layout.currentTab == 0
                  ? BrowsePage(key: const ValueKey('browse'), hasContent: hasContent)
                  : const LearnPage(key: ValueKey('learn')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.md, AppSpacing.xl, AppSpacing.xl),
            child: PrimaryButton(
              text: '添加更多内容',
              prefixIcon: Icons.add,
              expanded: true,
              onPressed: () => context.pushNamed(AppRoute.import.name),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabSwitcher extends StatelessWidget {
  const _TabSwitcher({required this.current, required this.onChanged});
  final int current;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            _TabItem(
              label: '浏览',
              active: current == 0,
              onTap: () => onChanged(0),
            ),
            _TabItem(
              label: '学习',
              active: current == 1,
              onTap: () => onChanged(1),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.label, required this.active, required this.onTap});
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: active ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

