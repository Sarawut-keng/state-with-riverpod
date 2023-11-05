import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef WidgetCallback = Widget Function();
typedef WidgetCallbackWithValue<T> = Widget Function(T value);

class AsyncWidgetController<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final WidgetCallback onLoading;
  final WidgetCallbackWithValue<String> onError;
  final WidgetCallbackWithValue<T> onComplete;

  const AsyncWidgetController({
    super.key,
    required this.asyncValue,
    required this.onLoading,
    required this.onError,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (asyncValue.isLoading) {
      return onLoading();
    } else if (asyncValue.hasError) {
      return onError(asyncValue.error.toString());
    }
    return onComplete(asyncValue.value as T);
  }
}
