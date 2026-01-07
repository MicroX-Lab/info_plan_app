import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/tag_provider.dart';
import '../../widgets/pill_tag.dart';

class TagManagementPage extends StatelessWidget {
  const TagManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = context.watch<TagProvider>();
    final topTags = tags.topTags;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
        title: const Text('标签管理', style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.xl),
        itemCount: topTags.length,
        itemBuilder: (context, index) {
          final top = topTags[index];
          final children = tags.childrenOf(top.id);
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.lg),
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.sell_outlined, color: AppColors.primary),
                    const SizedBox(width: AppSpacing.sm),
                    Text(top.name, style: AppTextStyle.titleMedium),
                    const Spacer(),
                    IconButton(icon: const Icon(Icons.edit, size: 18), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.add, size: 18), onPressed: () {}),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: children.map((c) => PillTag(text: c.name)).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

