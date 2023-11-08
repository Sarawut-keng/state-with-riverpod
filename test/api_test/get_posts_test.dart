import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/services/service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import 'get_posts_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final mockData = <Post>[
    Post(userId: 1, id: 1, title: 'Name', body: 'Body'),
    Post(userId: 1, id: 2, title: 'Hello', body: 'World'),
  ];

  test("When calling api should get List of Post", () async {
    // arrange
    final client = MockClient();
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
        .thenAnswer((_) async => http.Response(postToJson(mockData), 200));
    final getPostService = GetPostsService(client);
    const expectedValue = List<Post>;

    // act
    final response = await getPostService.getPosts();
    final actualvalue = response.runtimeType;

    // assert
    expect(actualvalue, expectedValue);
    expect(response[0].title, equals("Name"));
  });
}
