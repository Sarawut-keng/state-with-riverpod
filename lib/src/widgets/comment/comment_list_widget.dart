import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/src/models/model.dart';
import 'package:flutter_state_management/src/providers/provider.dart';
import 'package:flutter_state_management/src/widgets/widget.dart';

class CommentListWidget extends ConsumerWidget {
  final Post post;
  const CommentListWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Comment>> commentList = ref.watch(commentListProvider(post.id));
    return AsyncWidgetController(
      asyncValue: commentList,
      onLoading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      onError: (error) {
        return Center(
          child: Text(error),
        );
      },
      onComplete: (List<Comment> value) {
        return Expanded(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 4.0,
                      ),
                      margin: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        height: 30.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              value[index].email,
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                fontWeight: FontWeight.w700,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              value[index].body,
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
