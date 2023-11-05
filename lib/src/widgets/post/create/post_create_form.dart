import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/providers/provider.dart';

class PostCreateFormWidget extends ConsumerWidget {
  const PostCreateFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            label: Text('Topic'),
          ),
          onChanged: (text) {
            ref.watch(saveNewPostProvider.notifier).setTitle(text);
          },
        ),
        TextField(
          decoration: InputDecoration(
            label: Text('Body'),
          ),
          maxLines: 5,
          onChanged: (value) {
            ref.watch(saveNewPostProvider.notifier).setBody(value);
          },
        ),
      ],
    );
  }
}
