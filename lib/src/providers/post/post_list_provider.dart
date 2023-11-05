import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'post_list_provider.g.dart';

@riverpod
class PostList extends _$PostList {
  @override
  Future<List<Post>> build() async {
    final client = http.Client();
    final getPostsService = GetPostsService(client);

    final response = await getPostsService.getPosts();

    return response;
  }
}
