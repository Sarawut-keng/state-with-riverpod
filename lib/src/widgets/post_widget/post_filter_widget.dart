import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/async_widget_controller.dart';

class PostFilterWidget extends ConsumerWidget {
  PostFilterWidget({super.key});

  final dropdownTextEditingController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> userList = ref.watch(userListProvider);

    return AsyncWidgetController(
      asyncValue: userList,
      onLoading: () => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
      onComplete: (List<User> users) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenu(
              controller: dropdownTextEditingController,
              dropdownMenuEntries: users.map((e) {
                return DropdownMenuEntry(
                  value: e.id,
                  label: e.username,
                );
              }).toList(),
              onSelected: (int? value) {
                ref.read(postFilterIndexProvider.notifier).setPostFilterIndex(value as int);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.refresh_rounded,
              ),
              onPressed: () {
                dropdownTextEditingController.clear();
                ref.read(postFilterIndexProvider.notifier).setPostFilterIndex(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
