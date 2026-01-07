import 'package:flutter/foundation.dart';

class LayoutProvider extends ChangeNotifier {
  int currentTab = 0; // 0 = browse, 1 = learn
  int currentPageIndex = 0;

  void switchTab(int index) {
    if (currentTab == index) return;
    currentTab = index;
    notifyListeners();
  }

  void setPage(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}

