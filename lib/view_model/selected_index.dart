import 'package:flutter_riverpod/flutter_riverpod.dart';

// A simple provider to hold the selected index
final selectedIndexProvider = StateProvider<int>((ref) {
  // Default value is 0 (could represent the first item in a list, for example)
  return 0;
});
