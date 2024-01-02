import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef WidgetCallback = Widget Function();
typedef WidgetCallbackWithValue<T> = Widget Function(T value);

class AsyncWidgetController<T> extends StatelessWidget {
  final List<AsyncValue<T>> asyncValue;
  final WidgetCallback onLoading;
  final WidgetCallbackWithValue<String> onError;
  final WidgetCallback onComplete;

  const AsyncWidgetController({
    super.key,
    required this.asyncValue,
    required this.onLoading,
    required this.onError,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (asyncValue.any((a) => a.isLoading)) {
      return onLoading();
    } else if (asyncValue.any((a) => a.hasError)) {
      return onError(asyncValue.firstWhere((a) => a.hasError).error.toString());
    }
    return onComplete();
  }
}
