
import 'dart:developer';

import 'package:flutter_state_management/src/models/model.dart';
import 'package:http/http.dart' as http;

class GetTodosService {
  final http.Client client;
  GetTodosService(this.client);

  Future<List<Todo>> getTodos() async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );
      // log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      return todoFromJson(response.body);
    } catch (error) {
      log('Error while fetching todo: $error');
      return [];
    }
  }
}
