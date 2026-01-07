import '../models/plan.dart';

class PlanService {
  Plan get mockPlan {
    final now = DateTime.now();
    final planId = 'plan-1';
    return Plan(
      id: planId,
      goal: '新手学习 web coding',
      status: PlanStatus.inProgress,
      tasks: [
        PlanTask(
          id: 'task-1',
          planId: planId,
          title: '了解 React 基础概念和组件思维',
          estimatedTime: 10,
          tags: const ['React', '基础'],
          status: TaskStatus.completed,
          completedAt: now.subtract(const Duration(days: 2)),
          createdAt: now.subtract(const Duration(days: 3)),
        ),
        PlanTask(
          id: 'task-2',
          planId: planId,
          title: '学习 JSX 语法和表达式',
          estimatedTime: 12,
          tags: const ['React', 'JSX'],
          status: TaskStatus.completed,
          completedAt: now.subtract(const Duration(days: 1)),
          createdAt: now.subtract(const Duration(days: 2)),
        ),
        PlanTask(
          id: 'task-3',
          planId: planId,
          title: '掌握 Props 和 State 的使用',
          description: '理解组件如何通过 Props 传递数据，以及如何使用 State 管理组件内部状态',
          estimatedTime: 8,
          tags: const ['状态管理入门'],
          status: TaskStatus.todo,
          createdAt: now.subtract(const Duration(hours: 12)),
        ),
      ],
      createdAt: now.subtract(const Duration(days: 3)),
      updatedAt: now,
    );
  }
}

