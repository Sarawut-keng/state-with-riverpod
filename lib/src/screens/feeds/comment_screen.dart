import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class CommentScreen extends StatelessWidget {
  final Post post;
  final User user;
  const CommentScreen({
    super.key,
    required this.post,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: <Widget>[
          CommentHeaderWidget(
            post: post,
            user: user,
          ),
          CommentListWidget(
            post: post,
          ),
        ],
      ),
    );
  }
}
