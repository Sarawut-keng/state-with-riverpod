// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/screens/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mockData = <Todo>[
    Todo(userId: 1, id: 1, title: 'coding', completed: true),
    Todo(userId: 1, id: 2, title: 'swimming', completed: false),
    Todo(userId: 2, id: 1, title: 'dojo', completed: false),
  ];

  Widget createWidgetAncestors({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Todo Screen Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoListProvider.overrideWith((ref) => mockData),
        ],
        child: createWidgetAncestors(
          child: TodoScreen(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('coding'), findsOneWidget);
    expect(find.text('netflix'), findsNothing);
  });
}
