import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWidgetController<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final Widget onLoading;
  final Widget onComplete;
  final Widget onError;
  const AsyncWidgetController({
    super.key,
    required this.asyncValue,
    required this.onLoading,
    required this.onComplete,
    required this.onError,
  });

  @override
  Widget build(BuildContext context) {
    if (asyncValue.isLoading) {
      return onLoading;
    } else if (asyncValue.hasError) {
      return onError;
    }
    return onComplete;
  }
}
