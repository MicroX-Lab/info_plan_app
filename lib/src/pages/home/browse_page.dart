import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../models/content.dart';
import '../../providers/content_provider.dart';
import '../../providers/layout_provider.dart';
import '../../widgets/pill_tag.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import 'content_detail_bottom_sheet.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key, required this.hasContent});

  final bool hasContent;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  late final PageController _controller;
  final Map<String, bool> _flipped = {};

  @override
  void initState() {
    super.initState();
    final initial = context.read<LayoutProvider>().currentPageIndex;
    _controller = PageController(viewportFraction: 0.95, initialPage: initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contents = context.watch<ContentProvider>().items;
    final layout = context.watch<LayoutProvider>();

    if (!widget.hasContent) {
      return const Center(child: Text('暂无内容，去添加吧'));
    }

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            onPageChanged: layout.setPage,
            itemCount: contents.length,
            itemBuilder: (context, index) {
              final content = contents[index];
              final flipped = _flipped[content.id] ?? false;
              return GestureDetector(
                onTap: () => setState(() => _flipped[content.id] = !flipped),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: Tilt(
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        final rotate = Tween(begin: flipped ? 1.0 : -1.0, end: 0.0)
                            .animate(animation);
                        return AnimatedBuilder(
                          animation: rotate,
                          builder: (context, _) {
                            final angle = rotate.value;
                            return Transform(
                              transform: Matrix4.rotationY(angle),
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                        );
                      },
                      child: flipped
                          ? _ContentBackCard(content: content, key: ValueKey('${content.id}-back'))
                          : _ContentFrontCard(content: content, key: ValueKey('${content.id}-front')),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        _PageIndicator(
          count: contents.length,
          activeIndex: layout.currentPageIndex,
        ),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

class _ContentFrontCard extends StatelessWidget {
  const _ContentFrontCard({required this.content, super.key});
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
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
          Expanded(
            child: Text(
              content.summary ?? content.content,
              style: AppTextStyle.body,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: content.tags.map((t) => PillTag(text: t)).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: '阅读原文',
                  onPressed: () => showContentDetailSheet(context, content),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: SecondaryButton(
                  text: '查看更多',
                  onPressed: () => showContentDetailSheet(context, content),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentBackCard extends StatelessWidget {
  const _ContentBackCard({required this.content, super.key});
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('摘要', style: AppTextStyle.titleMedium),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              content.summary ?? content.content,
              style: AppTextStyle.body,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: content.tags.map((t) => PillTag(text: t)).toList(),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: '查看详情',
            expanded: true,
            onPressed: () => showContentDetailSheet(context, content),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.count, required this.activeIndex});
  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        if (index == activeIndex) {
          return Container(
            width: 24,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: const BoxDecoration(
            color: AppColors.indicatorInactive,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

