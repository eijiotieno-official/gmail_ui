import 'package:flutter/material.dart';

class DrawerNotifier extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get globalKey => _globalKey;

  void openDrawer() {
    _globalKey.currentState?.openDrawer();
    notifyListeners();
  }
}
