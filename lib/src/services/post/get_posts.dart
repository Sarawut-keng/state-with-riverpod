
import 'dart:developer';

import 'package:flutter_state_management/src/models/model.dart';
import 'package:http/http.dart' as http;

class GetPostsService {
  final http.Client client;
  GetPostsService(this.client);

  Future<List<Post>> getPosts() async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      // log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      return postFromJson(response.body);
    } catch (error) {
      log('Error while fetching posts: $error');
      return [];
    }
  }
}
