import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../models/plan.dart';
import '../../providers/plan_provider.dart';
import '../../widgets/pill_tag.dart';
import '../../widgets/primary_button.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<PlanProvider>();
    final plan = planProvider.plan;
    if (plan == null) {
      return const Center(child: Text('暂无学习计划'));
    }

    final currentTask = planProvider.currentTask;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GoalCard(goal: plan.goal, onEdit: () {}),
          const SizedBox(height: AppSpacing.lg),
          _CompletedList(tasks: planProvider.completedTasks),
          const SizedBox(height: AppSpacing.lg),
          if (currentTask != null) _CurrentTaskCard(task: currentTask, onComplete: planProvider.completeCurrentTask),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal, required this.onEdit});
  final String goal;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('当前学习目标', style: AppTextStyle.caption),
                const SizedBox(height: 6),
                Text(goal, style: AppTextStyle.titleMedium),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, size: 18),
          ),
        ],
      ),
    );
  }
}

class _CompletedList extends StatelessWidget {
  const _CompletedList({required this.tasks});
  final List<PlanTask> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('已完成', style: AppTextStyle.caption),
            const SizedBox(width: 6),
            Text('(${tasks.length})', style: AppTextStyle.caption),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ...tasks.map((t) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.primary),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    t.title,
                    style: const TextStyle(decoration: TextDecoration.none, color: AppColors.textPrimary),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _CurrentTaskCard extends StatelessWidget {
  const _CurrentTaskCard({required this.task, required this.onComplete});
  final PlanTask task;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('当前任务', style: AppTextStyle.caption),
          const SizedBox(height: 6),
          Text(task.title, style: AppTextStyle.titleMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              if (task.estimatedTime != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.tagBackground,
                    borderRadius: BorderRadius.circular(AppSpacing.pillRadius),
                  ),
                  child: Text('${task.estimatedTime} 分钟', style: const TextStyle(color: AppColors.textPrimary)),
                ),
              const SizedBox(width: AppSpacing.sm),
              if (task.tags.isNotEmpty) PillTag(text: task.tags.first),
            ],
          ),
          const SizedBox(height: 12),
          if (task.description != null)
            Text(task.description ?? '', style: AppTextStyle.body),
          const SizedBox(height: 16),
          PrimaryButton(
            text: '完成并继续',
            prefixIcon: Icons.check,
            expanded: true,
            onPressed: onComplete,
          ),
        ],
      ),
    );
  }
}

