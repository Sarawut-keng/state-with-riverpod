// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

SavePost savePostFromJson(String str) => SavePost.fromJson(json.decode(str));

String savePostToJson(SavePost data) => json.encode(data.toJson());

class SavePost {
  String title;
  String body;
  int userId;

  SavePost({
    required this.title,
    required this.body,
    required this.userId,
  });

  SavePost copyWith({
    String? title,
    String? body,
    int? userId,
  }) =>
      SavePost(
        title: title ?? this.title,
        body: body ?? this.body,
        userId: userId ?? this.userId,
      );

  factory SavePost.fromJson(Map<String, dynamic> json) => SavePost(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}

SavePostResponse savePostResponseFromJson(String str) =>
    SavePostResponse.fromJson(json.decode(str));

String savePostResponseToJson(SavePostResponse data) => json.encode(data.toJson());

class SavePostResponse {
  int id;

  SavePostResponse({
    required this.id,
  });

  SavePostResponse copyWith({
    int? id,
  }) =>
      SavePostResponse(
        id: id ?? this.id,
      );

  factory SavePostResponse.fromJson(Map<String, dynamic> json) => SavePostResponse(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
