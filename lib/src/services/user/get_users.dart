import 'dart:developer';

import 'package:flutter_state_management/src/models/model.dart';
import 'package:http/http.dart' as http;

class GetUsersService {
  final http.Client client;
  GetUsersService(this.client);

  Future<List<User>> getUsers() async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      // log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      return userFromJson(response.body);
    } catch (error) {
      log('Error while fetching user: $error');
      return [];
    }
  }
}
