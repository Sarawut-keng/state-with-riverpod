import 'package:flutter_state_management/src/models/post.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/utility/provider_container.dart';
import 'package:test/test.dart';

void main() {
  group("Test Post Filter Index Provider", () {
    test("Create Provider state value should be 0", () {
      // arrange
      final container = createContainer();
      // act
      final result = container.read(postFilterIndexProvider);
      // assert
      expect(result, equals(0));
    });
  });

  group("Test Post List Provider", () {
    test("Provider should return List of Post", () async {
      // arrange
      final container = createContainer(
        overrides: [
          postListProvider.getProviderOverride(PostListProvider(0)).overrideWith((ref) {
            return [
              Post(userId: 1, id: 1, title: "Hello", body: "World"),
            ];
          })
        ],
      );
      const expectedValue = List<Post>;

      // act
      final result = container.read(postListProvider.call(0));
      final actualValue = result.value.runtimeType;

      // assert
      await expectLater(actualValue, expectedValue);
    });

    test("Fitler with 1, Provider should return List's length of Post than userId equal to 1",
        () async {
      // arrange
      final container = createContainer(
        overrides: [
          postListProvider.getProviderOverride(PostListProvider(0)).overrideWith((ref) {
            return [
              Post(userId: 1, id: 1, title: "Hello", body: "World"),
              Post(userId: 2, id: 2, title: "test", body: "fake"),
            ];
          }),
          postListProvider.getProviderOverride(PostListProvider(1)).overrideWith((ref) {
            return [
              Post(userId: 1, id: 1, title: "Hello", body: "World"),
            ];
          }),
        ],
      );
      const expectedValue = 1;

      // act
      final result = container.read(postListProvider.call(1));
      final actualValue = result.value?.length;

      // assert
      await expectLater(actualValue, expectedValue);
    });
  });
}
