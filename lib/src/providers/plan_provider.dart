import 'package:flutter/foundation.dart';

import '../models/plan.dart';
import '../services/local_store.dart';
import '../services/plan_service.dart';

class PlanProvider extends ChangeNotifier {
  PlanProvider() {
    _init();
  }

  final PlanService _service = PlanService();
  final LocalStore _store = LocalStore();
  Plan? _plan;

  Plan? get plan => _plan;
  PlanTask? get currentTask =>
      _plan?.tasks.firstWhere((t) => t.status != TaskStatus.completed, orElse: () => _plan!.tasks.first);
  List<PlanTask> get completedTasks =>
      _plan?.tasks.where((t) => t.status == TaskStatus.completed).toList() ?? [];

  Future<void> _init() async {
    final cached = await _store.loadPlan();
    _plan = cached ?? _service.mockPlan;
    notifyListeners();
  }

  void updateGoal(String goal) {
    if (_plan == null) return;
    _plan = Plan(
      id: _plan!.id,
      goal: goal,
      status: _plan!.status,
      tasks: _plan!.tasks,
      createdAt: _plan!.createdAt,
      updatedAt: DateTime.now(),
    );
    notifyListeners();
    _store.savePlan(_plan!);
  }

  void completeCurrentTask() {
    if (_plan == null) return;
    final updatedTasks = _plan!.tasks.map((task) {
      if (task.status == TaskStatus.completed) return task;
      if (task == currentTask) {
        return task.copyWith(status: TaskStatus.completed, completedAt: DateTime.now());
      }
      return task;
    }).toList();

    _plan = Plan(
      id: _plan!.id,
      goal: _plan!.goal,
      status: PlanStatus.inProgress,
      tasks: updatedTasks,
      createdAt: _plan!.createdAt,
      updatedAt: DateTime.now(),
    );
    notifyListeners();
    _store.savePlan(_plan!);
  }
}

