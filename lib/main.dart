import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/observer.dart';
import 'package:flutter_state_management/router.dart';

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
      onGenerateRoute: MyRouter.controller,
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'State management with ',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Riverpod',
                      style: TextStyle(
                        color: Colors.purple.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/todo-screen');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text("Todo"),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade400,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/post-screen');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text("Feeds"),
                    ),
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
