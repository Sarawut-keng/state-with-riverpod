import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';

class PostCreateFormButton extends ConsumerWidget {
  const PostCreateFormButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SavePost form = ref.watch(saveNewPostProvider);
    return BottomAppBar(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () async {
            if (form.title.isNotEmpty && form.body.isNotEmpty) {
              ref.read(postOverlayProvider.notifier).toggle();
              ref.read(saveNewPostProvider.notifier).setSavePost().then((value) {
                if (value) {
                  Navigator.of(context).popUntil((route) {
                    return route.settings.name == '/post-screen';
                  });
                }
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: (form.title.isNotEmpty && form.body.isNotEmpty) ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text('Post'),
            ),
          ),
        ),
      ),
    );
  }
}
