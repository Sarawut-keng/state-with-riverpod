import 'dart:developer';

import 'package:flutter_state_management/src/models/model.dart';
import 'package:http/http.dart' as http;

class SavePostService {
  final http.Client client;
  SavePostService(this.client);

  Future<SavePostResponse?> savePost(SavePost body) async {
    try {
      final response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: savePostToJson(body),
      );
      // log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      return savePostResponseFromJson(response.body);
    } catch (error) {
      log('Error while fetching posts: $error');
      return null;
    }
  }
}
