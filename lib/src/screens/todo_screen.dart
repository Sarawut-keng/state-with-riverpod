import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/todo_list_provider.dart';
import 'package:flutter_state_management/src/widgets/async_widget_controller.dart';

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
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: Center(
          child: Text(todoList.error.toString()),
        ),
        onComplete: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todoList.value?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(todoList.value![index].title),
              );
            },
          ),
        ),
      ),
    );
  }
}
