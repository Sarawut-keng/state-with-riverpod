import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Feeds'),
        backgroundColor: Colors.purple.shade400,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          PostHeaderWidget(),
          PostFilterWidget(),
          PostListCardWidget(),
        ],
      ),
    );
  }
}
