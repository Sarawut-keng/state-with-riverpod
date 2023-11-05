import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:http/http.dart' as http;

part 'comment_provider.g.dart';

@riverpod
Future<List<Comment>> commentList(CommentListRef ref, int postId) async {
  final client = http.Client();
  final getCommentService = GetCommentService(client);

  final response = await getCommentService.getComments(postId);

  return response;
}
