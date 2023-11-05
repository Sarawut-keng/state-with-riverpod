import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Post>> postList = ref.watch(postListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: AsyncWidgetController(
        asyncValue: postList,
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: Center(
          child: Text(postList.error.toString()),
        ),
        onComplete: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: postList.value?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(postList.value![index].title),
              );
            },
          ),
        ),
      ),
    );
  }
}
