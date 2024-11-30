import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerViewModel extends Notifier<GlobalKey<ScaffoldState>> {
  @override
  build() {
    return GlobalKey<ScaffoldState>();
  }

  void openDrawer() {
    state.currentState?.openDrawer();
  }

  void closeDrawer() {
    state.currentState?.closeDrawer();
  }
}

final drawerProvider =
    NotifierProvider<DrawerViewModel, GlobalKey<ScaffoldState>>(
        DrawerViewModel.new);
