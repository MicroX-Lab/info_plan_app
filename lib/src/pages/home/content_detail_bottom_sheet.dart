import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../models/content.dart';
import '../../widgets/pill_tag.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

Future<void> showContentDetailSheet(BuildContext context, Content content) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.cardRadius)),
    ),
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.primary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 6),
                    const Text('返回', style: TextStyle(color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(content.title, style: AppTextStyle.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          '${content.sourceName ?? ''} · ${content.displayDate} · ${content.displayReadTime}',
                          style: AppTextStyle.caption,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          content.content,
                          style: AppTextStyle.body,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: AppSpacing.sm,
                          runSpacing: AppSpacing.sm,
                          children: content.tags.map((t) => PillTag(text: t)).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: '阅读全文',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: SecondaryButton(
                        text: '查看更多',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

