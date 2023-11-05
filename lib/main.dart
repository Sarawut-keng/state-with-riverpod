import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/observer.dart';
import 'package:flutter_state_management/src/screens/screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        MyObserver(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/todo-screen': (_) => const TodoScreen(),
        '/post-screen': (_) => const PostScreen(),
        '/post-create-screen': (_) => const PostCreateScreen(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'State Management with Riverpod',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/todo-screen');
                    },
                    child: Text("Todo"),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/post-screen');
                    },
                    child: Text("Post"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
