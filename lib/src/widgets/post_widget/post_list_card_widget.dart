import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class PostListCardWidget extends ConsumerWidget {
  const PostListCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int postFilterIndex = ref.watch(postFilterIndexProvider);
    final AsyncValue<List<Post>> postList = ref.watch(postListProvider(postFilterIndex));
    final AsyncValue<List<User>> userList = ref.watch(userListProvider);
    return AsyncWidgetController(
      asyncValue: postList,
      onLoading: () => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
      onComplete: (List<Post> value) => Expanded(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final user = userList.value?.firstWhere((e) => e.id == value[index].userId);
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.black54,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value[index].title,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Divider(
                      height: 8,
                    ),
                    Text(
                      value[index].body,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(
                      height: 8,
                    ),
                    Text(
                      user?.username ?? '',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.cyan[800],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
