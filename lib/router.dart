import 'package:flutter/material.dart';
import 'package:flutter_state_management/main.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/screens/screen.dart';

class MyRouter {
  static const String todoScreen = '/todo-screen';
  static const String postScreen = '/post-screen';
  static const String postCreateScreen = '/post-create-screen';
  static const String commentScreen = '/comment-screen';

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case todoScreen:
        return MaterialPageRoute(
          builder: (context) => TodoScreen(),
          settings: settings,
        );

      case postScreen:
        return MaterialPageRoute(
          builder: (context) => PostScreen(),
          settings: settings,
        );

      case postCreateScreen:
        return MaterialPageRoute(
          builder: (context) => PostCreateScreen(),
          settings: settings,
        );

      case commentScreen:
        final args = settings.arguments as CommentScreenArguments;
        return MaterialPageRoute(
          builder: (context) => CommentScreen(
            post: args.post,
            user: args.user,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
          settings: settings,
        );
    }
  }
}

class CommentScreenArguments {
  final Post post;
  final User user;
  CommentScreenArguments({
    required this.post,
    required this.user,
  });
}
