import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/models/model.dart';

class CommentHeaderWidget extends StatelessWidget {
  final Post post;
  final User user;
  const CommentHeaderWidget({
    super.key,
    required this.post,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(
            height: 8,
          ),
          Text(
            post.body,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(
            height: 8,
          ),
          Text(
            user.username,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              fontWeight: FontWeight.w700,
              color: Colors.cyan[800],
            ),
          ),
        ],
      ),
    );
  }
}
