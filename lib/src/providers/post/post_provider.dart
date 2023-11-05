import 'package:flutter_state_management/src/services/post/save_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:http/http.dart' as http;

part 'post_provider.g.dart';

@riverpod
class PostFilterIndex extends _$PostFilterIndex {
  @override
  int build() {
    return 0;
  }

  void setPostFilterIndex(int index) {
    state = index;
  }
}

@riverpod
Future<List<Post>> postList(PostListRef ref, int filterIndex) async {
  final client = http.Client();
  final getPostsService = GetPostsService(client);

  final response = await getPostsService.getPosts();

  if (filterIndex != 0) {
    return response.where((e) => e.userId == filterIndex).toList();
  }

  return response;
}

@riverpod
class SaveNewPost extends _$SaveNewPost {
  @override
  SavePost build() {
    return SavePost(
      title: '',
      body: '',
      userId: 1,
    );
  }

  void setTitle(String? text) {
    final newState = state.copyWith(title: text);
    state = newState;
  }

  void setBody(String? body) {
    final newState = state.copyWith(body: body);
    state = newState;
  }

  Future<bool> setSavePost() async {
    final client = http.Client();
    final savePostService = SavePostService(client);
    final response = await savePostService.savePost(state);
    if (response == null) {
      return false;
    }
    ref.invalidate(postListProvider);
    return true;
  }
}
