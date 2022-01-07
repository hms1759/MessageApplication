// To parse this JSON data, do
//
//     final TestModel = TestModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> TestModelFromJson(String str) => List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String TestModelToJson(List<TestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  TestModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
