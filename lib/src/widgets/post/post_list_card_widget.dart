import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/router.dart';
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
      asyncValue: [postList, userList],
      onLoading: () => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
      onComplete: () => Expanded(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: postList.value!.length,
            itemBuilder: (context, index) {
              final user = userList.value?.firstWhere((e) => e.id == postList.value![index].userId);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/comment-screen',
                    arguments: CommentScreenArguments(
                      post: postList.value![index],
                      user: user as User,
                    ),
                  );
                },
                child: Container(
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
                        postList.value![index].title,
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        height: 8,
                      ),
                      Text(
                        postList.value![index].body,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
