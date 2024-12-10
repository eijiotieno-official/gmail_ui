import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A reusable widget for handling asynchronous states (`AsyncValue`) like data, loading, and error.
class AsyncView<T> extends StatelessWidget {
  const AsyncView({
    super.key,
    required this.asyncValue,
    required this.builder,
    this.loadingWidget,
    this.errorBuilder,
  });

  /// Function to build the UI for error states.
  final Widget Function(Object error, StackTrace? stackTrace)? errorBuilder;

  /// The current asynchronous value representing the state.
  final AsyncValue<T> asyncValue;

  /// Function to build the UI when data is available.
  final Widget Function(T data) builder;

  /// Optional custom widget to display during loading.
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      // Render the builder for the data state.
      data: builder,

      // Display the custom loading widget or a default progress indicator.
      loading: () =>
          loadingWidget ?? const Center(child: CircularProgressIndicator()),

      // Render the custom error builder or a default error message.
      error: (error, stackTrace) =>
          errorBuilder?.call(error, stackTrace) ??
          Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
    );
  }
}
