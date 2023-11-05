import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Todo>> todoList = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Screen'),
      ),
      body: AsyncWidgetController(
        asyncValue: todoList,
        onLoading: () => Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Center(
          child: Text(error),
        ),
        onComplete: (List<Todo> value) => SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(value[index].title),
              );
            },
          ),
        ),
      ),
    );
  }
}
