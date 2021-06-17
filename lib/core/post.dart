import 'dart:convert';

List<PostDetail> postDetailFromJson(String str) =>
    List<PostDetail>.from(json.decode(str).map((x) => PostDetail.fromJson(x)));

String postDetailToJson(List<PostDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostDetail {
  PostDetail(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  int userId;
  int id;
  String title;
  String body;

  factory PostDetail.fromJson(Map<String, dynamic> json) => PostDetail(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]);

  Map<String, dynamic> toJson() =>
      {"userId": userId, "id": id, "title": title, "body": body};
}
