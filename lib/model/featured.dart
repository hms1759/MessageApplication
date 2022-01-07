// To parse this JSON data, do
//
//     final featuredModel = featuredModelFromJson(jsonString);

import 'dart:convert';

FeaturedModel featuredModelFromJson(String str)
=> FeaturedModel.fromJson(json.decode(str));

String featuredModelToJson(FeaturedModel data) => json.encode(data.toJson());

class FeaturedModel {
  FeaturedModel({
    required this.id,
    required this.tags,
    required this.content,
    required this.author,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  String id;
  List<String> tags;
  String content;
  String author;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  factory FeaturedModel.fromJson(Map<String, dynamic> json) => FeaturedModel(
    id: json["_id"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    content: json["content"],
    author: json["author"],
    authorSlug: json["authorSlug"],
    length: json["length"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "content": content,
    "author": author,
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };
}
