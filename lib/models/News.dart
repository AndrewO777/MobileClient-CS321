import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

@JsonSerializable()
class News {
  int id;
  String headline;
  String content;
  DateTime datePublished;
  String author;
  int schoolId;

  News({
    required this.id,
    required this.headline,
    required this.content,
    required this.datePublished,
    required this.author,
    required this.schoolId,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}