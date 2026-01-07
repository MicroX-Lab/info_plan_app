import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/content.dart';
import '../models/plan.dart';
import '../models/tag.dart';

class LocalStore {
  static const _contentKey = 'contents';
  static const _planKey = 'plan';
  static const _tagKey = 'tags';

  Future<List<Content>> loadContents() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_contentKey);
    if (raw == null) return [];
    final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    return list.map(Content.fromMap).toList();
  }

  Future<void> saveContents(List<Content> contents) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(contents.map((e) => e.toMap()).toList());
    await prefs.setString(_contentKey, raw);
  }

  Future<Plan?> loadPlan() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_planKey);
    if (raw == null) return null;
    return Plan.fromMap(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> savePlan(Plan plan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_planKey, jsonEncode(plan.toMap()));
  }

  Future<List<Tag>> loadTags() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_tagKey);
    if (raw == null) return [];
    final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    return list.map(Tag.fromMap).toList();
  }

  Future<void> saveTags(List<Tag> tags) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(tags.map((e) => e.toMap()).toList());
    await prefs.setString(_tagKey, raw);
  }
}

