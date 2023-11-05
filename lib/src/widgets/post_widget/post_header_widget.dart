import 'package:flutter/material.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Feeds',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              fontWeight: FontWeight.w900,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/post-create-screen');
            },
            child: Text('New Post'),
          ),
        ],
      ),
    );
  }
}
