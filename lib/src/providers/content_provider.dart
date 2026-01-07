import 'package:flutter/foundation.dart';

import '../models/content.dart';
import '../services/content_service.dart';
import '../services/local_store.dart';

class ContentProvider extends ChangeNotifier {
  ContentProvider() {
    ready = _init();
  }

  final ContentService _service = ContentService();
  final LocalStore _store = LocalStore();
  List<Content> _items = [];
  late final Future<void> ready;

  List<Content> get items => _items;
  bool get hasContent => _items.isNotEmpty;

  Future<void> _init() async {
    final cached = await _store.loadContents();
    if (cached.isNotEmpty) {
      _items = cached;
    } else {
      // Use a fixed set of mock cards so the browse page can be swiped immediately.
      _items = _service.mockContents.take(5).toList();
      await _store.saveContents(_items);
    }
    notifyListeners();
  }

  Future<void> addContent(Content content) async {
    _items = [..._items, content];
    await _store.saveContents(_items);
    notifyListeners();
  }
}

