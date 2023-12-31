import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'todo_list_provider.g.dart';

@riverpod
FutureOr<List<Todo>> todoList(TodoListRef ref) async {
  final client = http.Client();
  final getTodosService = GetTodosService(client);

  final response = await getTodosService.getTodos();

  return response;
}
