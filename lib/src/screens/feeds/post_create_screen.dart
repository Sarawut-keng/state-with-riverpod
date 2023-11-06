import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class PostCreateScreen extends ConsumerWidget {
  const PostCreateScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool postOverlay = ref.watch(postOverlayProvider);
    return LoadingOvervlay(
      isLoading: postOverlay,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New post'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: PostCreateFormWidget(),
          ),
        ),
        bottomNavigationBar: PostCreateFormButton(),
      ),
    );
  }
}
