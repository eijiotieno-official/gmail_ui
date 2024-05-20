import 'package:flutter/material.dart';

class NavigationNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  
  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
