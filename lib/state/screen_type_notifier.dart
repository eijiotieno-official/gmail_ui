import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';

class ScreenTypeNotifier extends ChangeNotifier {
  ScreenType _screenType = ScreenType.mobile;

  ScreenType get screenType => _screenType;

  void update(ScreenType type) {
    _screenType = type;
    notifyListeners();
  }
}
