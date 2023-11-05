import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'user_list_provider.g.dart';

@riverpod
class UserList extends _$UserList {
  @override
  Future<List<User>> build() async {
    final client = http.Client();
    final getUserService = GetUsersService(client);

    final response = await getUserService.getUsers();

    return response;
  }
}
