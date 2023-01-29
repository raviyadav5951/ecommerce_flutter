import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Re-usable and generic custom widget for handling data,loading and error state
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: ((error, stackTrace) =>
          Center(child: ErrorWidget(error.toString()))),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
