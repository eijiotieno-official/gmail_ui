import 'package:flutter/material.dart';

class NavigationNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _moreVisible = false;
  bool get moreVisible => _moreVisible;

  void updateIndex(int index) {
    _selectedIndex = index;
    if (index == 5) {
      _moreVisible = !_moreVisible;
    }
    notifyListeners();
  }
}
