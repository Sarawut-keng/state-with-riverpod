import 'dart:developer';

import 'package:flutter_state_management/src/models/model.dart';
import 'package:http/http.dart' as http;

class GetCommentService {
  final http.Client client;
  GetCommentService(this.client);

  Future<List<Comment>> getComments(int postId) async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'),
      );
      // log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      return commentFromJson(response.body);
    } catch (error) {
      log('Error while fetching comments: $error');
      return [];
    }
  }
}
