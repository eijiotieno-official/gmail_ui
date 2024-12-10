import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A ViewModel to manage the state and actions of a Scaffold's drawer.
class DrawerViewModel extends Notifier<GlobalKey<ScaffoldState>> {
  /// Initializes the `GlobalKey` for the Scaffold.
  @override
  GlobalKey<ScaffoldState> build() => GlobalKey<ScaffoldState>();

  /// Opens the drawer if the Scaffold state is available.
  void openDrawer() {
    state.currentState?.openDrawer();
  }

  /// Closes the drawer if the Scaffold state is available.
  void closeDrawer() {
    state.currentState?.closeDrawer();
  }
}

/// Provider to manage and expose the DrawerViewModel.
final drawerProvider =
    NotifierProvider<DrawerViewModel, GlobalKey<ScaffoldState>>(
  DrawerViewModel.new,
);
