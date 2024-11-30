// Import necessary Flutter packages.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The `AsyncView` widget is a utility for handling asynchronous states like data, loading, and error.
// It's a generic widget, meaning it can handle any type of data (`T`).
class AsyncView<T> extends StatelessWidget {
  // Constructor for `AsyncView`, requiring the async state and a data builder function.
  const AsyncView({
    super.key,
    required this.asyncValue, // The current asynchronous value (data, loading, or error).
    required this.builder, // Function to build the UI when data is available.
    this.loadingWidget, // Optional custom widget for the loading state.
    this.errorBuilder, // Optional custom function to handle errors.
  });

  // Function to build the error UI. Receives the error and stack trace.
  final Widget Function(Object error, StackTrace? stackTrace)? errorBuilder;

  // The asynchronous value that represents the current state.
  final AsyncValue<T> asyncValue;

  // Function to build the UI when data is available.
  final Widget Function(T data) builder;

  // Optional custom widget to show while loading.
  final Widget? loadingWidget;

  // The `build` method determines what to display based on the current state of `asyncValue`.
  @override
  Widget build(BuildContext context) {
    // Use `when` to handle the three possible states: data, loading, and error.
    return asyncValue.when(
      // If data is available, call the builder function to render the UI.
      data: builder,

      // If the state is loading, show the custom loading widget if provided.
      // Otherwise, display a default centered circular progress indicator.
      loading: () =>
          loadingWidget ??
          const Center(
            child: CircularProgressIndicator(strokeCap: StrokeCap.round),
          ),

      // If an error occurs, use the custom error builder if provided.
      // Otherwise, display a simple centered error message with the error details.
      error: (error, stackTrace) => errorBuilder != null
          ? errorBuilder!(error, stackTrace)
          : Center(
              child: Text(
                '$error', // Display the error as a string.
                style: TextStyle(
                  fontSize:
                      16, // Use a readable font size for the error message.
                ),
              ),
            ),
    );
  }
}
