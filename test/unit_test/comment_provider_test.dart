import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/utility/provider_container.dart';
import 'package:test/test.dart';

void main() {
  group("Test Comment Provider", () {
    test("Comment should return List of Comment Type", () async {
      // arrange
      final container = createContainer();
      const expectedValue = List<Comment>;

      // act
      final actualValue =
          container.read(commentListProvider.call(1).future).then((value) => value.runtimeType);

      // expect
      await expectLater(
        actualValue,
        completion(expectedValue),
      );
    });
  });
}
