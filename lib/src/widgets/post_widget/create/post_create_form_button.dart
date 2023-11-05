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
          onTap: () {
            if (form.title.isNotEmpty && form.body.isNotEmpty) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Dialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
              ref.read(saveNewPostProvider.notifier).setSavePost();
              Navigator.of(context).pop();
              Navigator.of(context).popUntil((route) {
                return route.settings.name == '/post-screen';
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
