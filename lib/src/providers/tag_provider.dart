import 'package:flutter/foundation.dart';

import '../models/tag.dart';
import '../services/local_store.dart';
import '../services/tag_service.dart';

class TagProvider extends ChangeNotifier {
  TagProvider() {
    _init();
  }

  final TagService _service = TagService();
  final LocalStore _store = LocalStore();
  List<Tag> _tags = [];

  List<Tag> get tags => _tags;
  List<Tag> get topTags => _tags.where((t) => t.parentId == null).toList();
  List<Tag> childrenOf(String parentId) =>
      _tags.where((t) => t.parentId == parentId).toList();

  Future<void> _init() async {
    final cached = await _store.loadTags();
    _tags = cached.isNotEmpty ? cached : _service.mockTags;
    notifyListeners();
    await _store.saveTags(_tags);
  }
}

